"""Recursos do desktop: tags, modelos, lixeira, métricas, colunas, timer,
prazos, busca e histórico — e o isolamento entre usuários."""
from datetime import timedelta

from django.contrib.auth.models import User
from django.utils import timezone
from rest_framework import status
from rest_framework.test import APITestCase

from apps.tasks.models import Subtask, Task, TaskActivity, TimeEntry

from .models import Column, Project, Tag


class DesktopAPITest(APITestCase):
    def setUp(self):
        self.user = User.objects.create_user(username='dono', password='x')
        self.outro = User.objects.create_user(username='outro', password='x')
        self.client.force_authenticate(user=self.user)
        self.projeto = Project.objects.create(nome='Proj', criado_por=self.user)
        self.todo = Column.objects.create(projeto=self.projeto, nome='A fazer', posicao=0)
        self.feito = Column.objects.create(projeto=self.projeto, nome='Feito', posicao=1, is_done_column=True)
        self.task = Task.objects.create(
            titulo='Escrever testes', criado_por=self.user, projeto=self.projeto, coluna=self.todo,
        )

    # ── Tags ────────────────────────────────────────────────────────────────
    def test_tags_crud_e_vinculo_projeto_task(self):
        r = self.client.post('/api/tags/', {'nome': 'urgente', 'cor': '#ff0000'})
        self.assertEqual(r.status_code, 201)
        tag_id = r.data['id']
        self.assertEqual(self.client.post('/api/tags/', {'nome': 'URGENTE'}).status_code, 400)

        # task só aceita tag que o projeto oferece
        self.client.put(f'/api/tasks/{self.task.pk}/tags/', {'ids': [tag_id]}, format='json')
        self.assertEqual(self.task.tags.count(), 0)

        self.client.put(f'/api/projects/{self.projeto.pk}/tags/', {'ids': [tag_id]}, format='json')
        r = self.client.put(f'/api/tasks/{self.task.pk}/tags/', {'ids': [tag_id]}, format='json')
        self.assertEqual([t['nome'] for t in r.data], ['urgente'])
        self.assertTrue(TaskActivity.objects.filter(task=self.task, tipo='tags_changed').exists())

        lista = self.client.get('/api/tags/').data
        self.assertEqual((lista[0]['task_count'], lista[0]['project_count']), (1, 1))

        # tirar do projeto tira das tasks
        self.client.put(f'/api/projects/{self.projeto.pk}/tags/', {'ids': []}, format='json')
        self.assertEqual(self.task.tags.count(), 0)

    def test_tags_de_outro_usuario_nao_aparecem(self):
        Tag.objects.create(nome='alheia', criado_por=self.outro)
        self.assertEqual(self.client.get('/api/tags/').data, [])

    # ── Lixeira ─────────────────────────────────────────────────────────────
    def test_lixeira_arquivar_restaurar_excluir(self):
        self.client.delete(f'/api/tasks/{self.task.pk}/')
        self.assertEqual(self.client.get('/api/trash/contagem/').data, {'projetos': 0, 'tasks': 1})
        self.assertEqual(self.client.get('/api/trash/').data['tasks'][0]['titulo'], 'Escrever testes')

        self.client.post(f'/api/trash/tasks/{self.task.pk}/restaurar/')
        self.assertTrue(Task.objects.filter(pk=self.task.pk).exists())

        self.client.delete(f'/api/projects/{self.projeto.pk}/')
        self.assertEqual(self.client.get('/api/trash/contagem/').data['projetos'], 1)
        r = self.client.delete(f'/api/trash/projetos/{self.projeto.pk}/')
        self.assertEqual(r.status_code, 204)
        self.assertFalse(Project.all_objects.filter(pk=self.projeto.pk).exists())
        self.assertFalse(Task.all_objects.filter(pk=self.task.pk).exists())

    def test_lixeira_de_outro_usuario_e_invisivel(self):
        self.client.delete(f'/api/projects/{self.projeto.pk}/')
        self.client.force_authenticate(user=self.outro)
        self.assertEqual(self.client.get('/api/trash/contagem/').data, {'projetos': 0, 'tasks': 0})
        self.assertEqual(self.client.delete(f'/api/trash/projetos/{self.projeto.pk}/').status_code, 404)

    # ── Colunas ─────────────────────────────────────────────────────────────
    def test_excluir_coluna_move_tasks_para_destino(self):
        r = self.client.delete(f'/api/columns/{self.todo.pk}/')
        self.assertEqual(r.status_code, 400)
        self.assertEqual(self.client.get(f'/api/columns/{self.todo.pk}/contagem/').data['total'], 1)
        r = self.client.delete(f'/api/columns/{self.todo.pk}/?mover_para={self.feito.pk}')
        self.assertEqual(r.status_code, 204)
        self.task.refresh_from_db()
        self.assertEqual((self.task.coluna_id, self.task.status), (self.feito.pk, 'concluido'))

    def test_excluir_categoria_em_uso(self):
        from .models import Category
        cat = Category.objects.create(nome='Trabalho', criado_por=self.user)
        self.projeto.categoria = cat
        self.projeto.save()
        self.assertEqual(self.client.delete(f'/api/categories/{cat.pk}/').status_code, 204)
        self.projeto.refresh_from_db()
        self.assertIsNone(self.projeto.categoria_id)

    # ── Modelos ─────────────────────────────────────────────────────────────
    def test_modelo_a_partir_do_projeto(self):
        r = self.client.post('/api/templates/do-projeto/', {'projeto': str(self.projeto.pk), 'nome': 'Kanban'})
        self.assertEqual(r.status_code, 201)
        self.assertEqual(r.data['column_count'], 2)
        conteudo = self.client.get(f"/api/templates/{r.data['id']}/conteudo/").data
        self.assertEqual([c['nome'] for c in conteudo['colunas']], ['A fazer', 'Feito'])
        self.client.patch(f"/api/templates/{r.data['id']}/", {'nome': 'Kanban 2'})
        self.assertEqual(self.client.get('/api/templates/').data[0]['nome'], 'Kanban 2')

    # ── Timer ───────────────────────────────────────────────────────────────
    def test_timer_um_por_vez_e_totais(self):
        outra = Task.objects.create(titulo='Outra', criado_por=self.user, projeto=self.projeto, coluna=self.todo)
        a = self.client.post('/api/time-entries/iniciar/', {'task': str(self.task.pk)}).data
        self.client.post('/api/time-entries/iniciar/', {'task': str(outra.pk)})
        self.assertIsNotNone(TimeEntry.objects.get(pk=a['id']).fim)  # o primeiro parou
        rodando = self.client.get('/api/time-entries/rodando/').data
        self.assertEqual(rodando['task_titulo'], 'Outra')
        self.client.post(f"/api/time-entries/{rodando['id']}/parar/")
        self.assertIsNone(self.client.get('/api/time-entries/rodando/').data)

        inicio = timezone.now() - timedelta(hours=2)
        r = self.client.post('/api/time-entries/', {
            'task': str(self.task.pk), 'inicio': inicio.isoformat(),
            'fim': (inicio + timedelta(hours=1)).isoformat(), 'nota': 'manual',
        })
        self.assertEqual(r.status_code, 201)
        totais = self.client.get(f'/api/time-entries/totais/?tasks={self.task.pk}').data
        self.assertGreaterEqual(totais[str(self.task.pk)], 3600)
        card = self.client.get(f'/api/projects/{self.projeto.pk}/board/').data[0]['tasks'][0]
        self.assertGreaterEqual(card['tempo_segundos'], 3600)

    def test_lancamento_com_fim_antes_do_inicio(self):
        agora = timezone.now()
        r = self.client.post('/api/time-entries/', {
            'task': str(self.task.pk), 'inicio': (agora - timedelta(hours=1)).isoformat(),
            'fim': (agora - timedelta(hours=2)).isoformat(),
        })
        self.assertEqual(r.status_code, 400)

    # ── Prazos, busca, métricas ─────────────────────────────────────────────
    def test_proximas_busca_e_metricas(self):
        self.task.data_limite = timezone.now() - timedelta(days=1)
        self.task.save()
        Subtask.objects.create(task=self.task, titulo='revisar fixtures')
        Task.objects.create(titulo='Pronta', criado_por=self.user, projeto=self.projeto,
                            coluna=self.feito, data_limite=timezone.now())

        proximas = self.client.get('/api/tasks/proximas/').data
        self.assertEqual([t['titulo'] for t in proximas], ['Escrever testes'])

        busca = self.client.get('/api/tasks/busca/?q=fixtures').data
        self.assertEqual(busca[0]['hit_subtarefa'], 'revisar fixtures')

        resumo = self.client.get('/api/metrics/resumo/').data
        self.assertEqual((resumo['tasks_open'], resumo['tasks_done'], resumo['tasks_overdue']), (1, 1, 1))
        self.assertEqual(self.client.get('/api/metrics/progresso/').data[0]['total_tasks'], 2)
        self.assertEqual(len(self.client.get('/api/metrics/carga-colunas/').data), 2)

        Task.objects.filter(pk=self.task.pk).update(atualizado_em=timezone.now() - timedelta(days=30))
        paradas = self.client.get('/api/metrics/paradas/?dias=14').data
        self.assertEqual(paradas[0]['titulo'], 'Escrever testes')

    def test_busca_nao_mostra_tasks_de_outros(self):
        self.client.force_authenticate(user=self.outro)
        self.assertEqual(self.client.get('/api/tasks/busca/?q=testes').data, [])
        self.assertEqual(self.client.get('/api/metrics/resumo/').data['tasks_open'], 0)

    # ── Histórico ───────────────────────────────────────────────────────────
    def test_historico_registra_criacao_campos_e_movimento(self):
        r = self.client.post('/api/tasks/', {
            'titulo': 'Nova', 'projeto': str(self.projeto.pk), 'coluna': str(self.todo.pk),
        })
        self.assertEqual(r.status_code, 201)
        tid = r.data['id']
        self.client.patch(f'/api/tasks/{tid}/', {'titulo': 'Nova 2', 'prioridade': ''})
        self.client.post(f'/api/tasks/{tid}/move/', {'coluna_id': str(self.feito.pk), 'posicao': 0})
        tipos = [a['tipo'] for a in self.client.get(f'/api/tasks/{tid}/atividades/').data]
        self.assertEqual(sorted(tipos), ['created', 'field_changed', 'field_changed', 'moved'])

    def test_criar_task_em_projeto_alheio_e_recusado(self):
        self.client.force_authenticate(user=self.outro)
        r = self.client.post('/api/tasks/', {
            'titulo': 'Invasão', 'projeto': str(self.projeto.pk), 'coluna': str(self.todo.pk),
        })
        self.assertEqual(r.status_code, 400)

    def test_reordenar_subtarefas(self):
        a = Subtask.objects.create(task=self.task, titulo='a', posicao=0)
        b = Subtask.objects.create(task=self.task, titulo='b', posicao=1)
        self.client.put(f'/api/tasks/{self.task.pk}/subtarefas/reordenar/', {'ids': [str(b.pk), str(a.pk)]},
                        format='json')
        a.refresh_from_db()
        b.refresh_from_db()
        self.assertEqual((a.posicao, b.posicao), (1, 0))

    def test_preferencias_do_usuario(self):
        r = self.client.put('/api/auth/settings/', {'preferencias': {'font': 'playful'}}, format='json')
        self.assertEqual(r.data['preferencias'], {'font': 'playful'})

    def test_filtro_tasks_sem_projeto(self):
        Task.objects.create(titulo='Solta', criado_por=self.user)
        r = self.client.get('/api/tasks/?projeto__isnull=true')
        self.assertEqual([t['titulo'] for t in r.data['results']], ['Solta'])
