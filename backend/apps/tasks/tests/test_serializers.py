from django.test import TestCase
from django.contrib.auth.models import User
from rest_framework.test import APIRequestFactory
from apps.tasks.models import Task
from apps.tasks.serializers import TaskSerializer, TaskUpdateSerializer, TaskCreateSerializer


class TaskSerializerValidationTest(TestCase):
    def setUp(self):
        self.user = User.objects.create_user(username='testuser', password='pass123')
        self.factory = APIRequestFactory()

    def _make_request(self):
        request = self.factory.get('/')
        request.user = self.user
        return request

    def test_titulo_vazio_invalido(self):
        """Título vazio deve falhar na validação."""
        serializer = TaskSerializer(data={'titulo': '   '}, context={'request': self._make_request()})
        self.assertFalse(serializer.is_valid())
        self.assertIn('titulo', serializer.errors)

    def test_titulo_valido_faz_strip(self):
        """Título com espaços deve ser limpo."""
        serializer = TaskCreateSerializer(data={'titulo': '  Minha tarefa  '})
        self.assertTrue(serializer.is_valid(), serializer.errors)
        self.assertEqual(serializer.validated_data.get('titulo'), 'Minha tarefa')

    def test_status_nao_pode_sair_de_concluido(self):
        """Não pode alterar status de uma task concluída."""
        task = Task.objects.create(titulo='Tarefa', criado_por=self.user, status='concluido')
        serializer = TaskUpdateSerializer(
            instance=task,
            data={'status': 'backlog'},
            partial=True,
        )
        self.assertFalse(serializer.is_valid())
        self.assertIn('status', serializer.errors)

    def test_status_pode_permanecer_concluido(self):
        """Pode manter status concluido ao atualizar outros campos."""
        task = Task.objects.create(titulo='Tarefa', criado_por=self.user, status='concluido')
        serializer = TaskUpdateSerializer(
            instance=task,
            data={'status': 'concluido', 'titulo': 'Novo título'},
            partial=True,
        )
        self.assertTrue(serializer.is_valid())

    def test_atribuido_para_usuario_inativo_invalido(self):
        """Não deve permitir atribuir para usuário inativo."""
        inativo = User.objects.create_user(username='inativo', password='pass123', is_active=False)
        serializer = TaskSerializer(
            data={'titulo': 'Tarefa', 'atribuido_para': inativo.pk},
            context={'request': self._make_request()},
        )
        self.assertFalse(serializer.is_valid())
        self.assertIn('atribuido_para', serializer.errors)

    def test_atribuido_para_usuario_ativo_valido(self):
        """Deve permitir atribuir para usuário ativo."""
        ativo = User.objects.create_user(username='ativo', password='pass123')
        serializer = TaskSerializer(
            data={'titulo': 'Tarefa', 'atribuido_para': ativo.pk},
            context={'request': self._make_request()},
        )
        serializer.is_valid()
        self.assertNotIn('atribuido_para', serializer.errors)
