from django.contrib.auth.models import User
from django.core.cache import cache
from django.urls import reverse
from rest_framework import status
from rest_framework.test import APITestCase
from rest_framework_simplejwt.tokens import RefreshToken

from .enums import UserStatus


def _set_status(user, value):
    user.profile.status = value
    user.profile.save(update_fields=['status'])


class UserApprovalTests(APITestCase):
    password = 'senha-forte-123'

    def setUp(self):
        cache.clear()  # o throttle de login conta por IP entre os testes
        self.user = User.objects.create_user(username='novo', password=self.password)

    def _login(self, username='novo', password=None):
        return self.client.post(
            reverse('authentication:login'),
            {'username': username, 'password': password or self.password},
            format='json',
        )

    def test_new_user_starts_pending(self):
        self.assertEqual(self.user.profile.status, UserStatus.PENDENTE)

    def test_superuser_starts_approved(self):
        admin = User.objects.create_superuser(username='root', password='x', email='r@x.com')
        self.assertEqual(admin.profile.status, UserStatus.APROVADO)

    def test_register_returns_pending_without_tokens(self):
        res = self.client.post(reverse('authentication:register'), {
            'username': 'cadastro',
            'email': 'c@x.com',
            'password': 'senha-forte-123',
            'password_confirm': 'senha-forte-123',
        }, format='json')
        self.assertEqual(res.status_code, status.HTTP_201_CREATED)
        self.assertEqual(res.data['status'], UserStatus.PENDENTE)
        self.assertNotIn('tokens', res.data)

    def test_pending_user_cannot_login(self):
        res = self._login()
        self.assertEqual(res.status_code, status.HTTP_403_FORBIDDEN)
        self.assertEqual(res.data['code'], 'account_pendente')

    def test_rejected_user_cannot_login(self):
        _set_status(self.user, UserStatus.REJEITADO)
        res = self._login()
        self.assertEqual(res.status_code, status.HTTP_403_FORBIDDEN)
        self.assertEqual(res.data['code'], 'account_rejeitado')

    def test_wrong_password_does_not_reveal_status(self):
        res = self._login(password='errada')
        self.assertEqual(res.status_code, status.HTTP_401_UNAUTHORIZED)
        self.assertNotIn('code', res.data if isinstance(res.data, dict) else {})

    def test_approved_user_can_login(self):
        _set_status(self.user, UserStatus.APROVADO)
        res = self._login()
        self.assertEqual(res.status_code, status.HTTP_200_OK)
        self.assertIn('access', res.data)

    def test_token_stops_working_when_approval_is_revoked(self):
        _set_status(self.user, UserStatus.APROVADO)
        refresh = RefreshToken.for_user(self.user)
        self.client.credentials(HTTP_AUTHORIZATION=f'Bearer {refresh.access_token}')
        self.assertEqual(self.client.get(reverse('authentication:user_profile')).status_code, 200)

        _set_status(self.user, UserStatus.REJEITADO)
        self.assertEqual(self.client.get(reverse('authentication:user_profile')).status_code, 403)

    def test_refresh_blocked_when_not_approved(self):
        refresh = RefreshToken.for_user(self.user)  # pendente
        res = self.client.post(reverse('authentication:refresh'), {'refresh': str(refresh)}, format='json')
        self.assertEqual(res.status_code, status.HTTP_401_UNAUTHORIZED)
