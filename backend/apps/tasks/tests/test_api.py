from django.test import TestCase
from django.contrib.auth.models import User
from rest_framework.test import APIClient
from rest_framework import status
from apps.tasks.models import Task


class TaskAPITest(TestCase):
    def setUp(self):
        self.client = APIClient()
        self.owner = User.objects.create_user(username='owner', password='pass123')
        self.other = User.objects.create_user(username='other', password='pass123')
        self.client.force_authenticate(user=self.owner)
        self.task = Task.objects.create(titulo='Tarefa do owner', criado_por=self.owner)

    def test_listar_tasks_retorna_200(self):
        """Lista de tasks retorna 200."""
        response = self.client.get('/api/tasks/')
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_criar_task_retorna_201(self):
        """Criação de task retorna 201."""
        response = self.client.post('/api/tasks/', {'titulo': 'Nova tarefa'})
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)

    def test_criar_task_define_criado_por(self):
        """Task criada pela API tem criado_por preenchido automaticamente."""
        self.client.post('/api/tasks/', {'titulo': 'Tarefa auto'})
        task = Task.objects.get(titulo='Tarefa auto')
        self.assertEqual(task.criado_por, self.owner)

    def test_atualizar_task_propria_retorna_200(self):
        """Owner pode atualizar sua task."""
        response = self.client.patch(f'/api/tasks/{self.task.pk}/', {'titulo': 'Atualizado'})
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_atualizar_task_alheia_retorna_403(self):
        """Não-owner não pode atualizar task alheia."""
        self.client.force_authenticate(user=self.other)
        response = self.client.patch(f'/api/tasks/{self.task.pk}/', {'titulo': 'Hack'})
        self.assertEqual(response.status_code, status.HTTP_403_FORBIDDEN)

    def test_deletar_task_faz_soft_delete(self):
        """Delete via API não remove do banco (soft delete)."""
        response = self.client.delete(f'/api/tasks/{self.task.pk}/')
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)
        self.assertTrue(Task.all_objects.filter(pk=self.task.pk).exists())

    def test_task_deletada_nao_aparece_na_listagem(self):
        """Task soft-deletada não aparece na listagem."""
        self.task.delete()
        response = self.client.get('/api/tasks/')
        ids = [t['id'] for t in response.data['results']]
        self.assertNotIn(str(self.task.pk), ids)

    def test_sem_autenticacao_retorna_401(self):
        """Sem autenticação retorna 401."""
        self.client.force_authenticate(user=None)
        response = self.client.get('/api/tasks/')
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)
