from django.test import TestCase
from django.contrib.auth.models import User
from apps.tasks.models import Task


class TaskSoftDeleteTest(TestCase):
    def setUp(self):
        self.user = User.objects.create_user(username='testuser', password='pass123')
        self.task = Task.objects.create(
            titulo='Tarefa teste',
            criado_por=self.user,
        )

    def test_delete_nao_remove_do_banco(self):
        """Soft delete não remove o registro do banco."""
        self.task.delete()
        self.assertTrue(Task.all_objects.filter(pk=self.task.pk).exists())

    def test_delete_define_deletado_em(self):
        """Soft delete preenche o campo deletado_em."""
        self.task.delete()
        self.task.refresh_from_db()
        self.assertIsNotNone(self.task.deletado_em)

    def test_manager_padrao_exclui_deletadas(self):
        """O manager padrão não retorna tasks deletadas."""
        self.task.delete()
        self.assertFalse(Task.objects.filter(pk=self.task.pk).exists())

    def test_manager_padrao_retorna_ativas(self):
        """O manager padrão retorna tasks não deletadas."""
        self.assertIn(self.task, Task.objects.all())

    def test_is_deleted_property(self):
        """Propriedade is_deleted reflete o estado correto."""
        self.assertFalse(self.task.is_deleted)
        self.task.delete()
        self.task.refresh_from_db()
        self.assertTrue(self.task.is_deleted)


class TaskHistoryTest(TestCase):
    def setUp(self):
        self.user = User.objects.create_user(username='testuser', password='pass123')
        self.task = Task.objects.create(
            titulo='Tarefa original',
            criado_por=self.user,
        )

    def test_historico_registra_mudanca_de_status(self):
        """Histórico é criado ao alterar o status."""
        self.task._history_user = self.user
        self.task.status = 'em_andamento'
        self.task.save()

        historico = self.task.history.filter(field_name='status')
        self.assertEqual(historico.count(), 1)
        self.assertEqual(historico.first().old_value, 'backlog')
        self.assertEqual(historico.first().new_value, 'em_andamento')

    def test_historico_registra_mudanca_de_titulo(self):
        """Histórico é criado ao alterar o título."""
        self.task._history_user = self.user
        self.task.titulo = 'Novo título'
        self.task.save()

        historico = self.task.history.filter(field_name='titulo')
        self.assertEqual(historico.count(), 1)

    def test_sem_history_user_nao_cria_historico(self):
        """Sem _history_user definido, não cria histórico."""
        self.task.status = 'em_andamento'
        self.task.save()

        self.assertEqual(self.task.history.count(), 0)
