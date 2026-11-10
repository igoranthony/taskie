"""Produção: API atrás de proxy reverso com HTTPS (taskie-api.zntt.dev.br).

Tudo que é segredo ou depende do servidor vem do ambiente. O deploy da VPS
(compose, Caddy, .env) fica fora deste repo.
"""
from decouple import Csv, config

from .base import *  # noqa: F401,F403
from .base import REST_FRAMEWORK, SIMPLE_JWT

DEBUG = False

# Sem default de propósito: sem SECRET_KEY no ambiente a API nem sobe.
SECRET_KEY = config('SECRET_KEY')
SIMPLE_JWT['SIGNING_KEY'] = SECRET_KEY

ALLOWED_HOSTS = config('ALLOWED_HOSTS', default='taskie-api.zntt.dev.br', cast=Csv())

# ── Proxy reverso (Caddy termina o HTTPS) ────────────────────────────────────
# Sem isso o Django acha que a requisição é http e monta logo_url/arquivo_url
# como http://, que o app desktop bloqueia.
SECURE_PROXY_SSL_HEADER = ('HTTP_X_FORWARDED_PROTO', 'https')
USE_X_FORWARDED_HOST = True
# O Caddy já redireciona http → https.
SECURE_SSL_REDIRECT = False

SESSION_COOKIE_SECURE = True
CSRF_COOKIE_SECURE = True
CSRF_TRUSTED_ORIGINS = config(
    'CSRF_TRUSTED_ORIGINS', default='https://taskie-api.zntt.dev.br', cast=Csv()
)

# Começa curto; depois de confirmar que o HTTPS está estável, subir para 31536000.
SECURE_HSTS_SECONDS = config('SECURE_HSTS_SECONDS', default=3600, cast=int)
SECURE_CONTENT_TYPE_NOSNIFF = True
X_FRAME_OPTIONS = 'DENY'

# ── CORS ─────────────────────────────────────────────────────────────────────
# Origens do app desktop (Tauri v2): Windows usa http(s)://tauri.localhost,
# macOS/Linux usam tauri://localhost. O app mobile não passa por CORS.
CORS_ALLOW_ALL_ORIGINS = False
CORS_ALLOWED_ORIGINS = config(
    'CORS_ALLOWED_ORIGINS',
    default='http://tauri.localhost,https://tauri.localhost,tauri://localhost',
    cast=Csv(),
)

# ── API ──────────────────────────────────────────────────────────────────────
# Swagger/Redoc só renderizam JSON em produção (sem a UI navegável do DRF).
REST_FRAMEWORK['DEFAULT_RENDERER_CLASSES'] = ['rest_framework.renderers.JSONRenderer']

# Arquivos maiores que isso vão para disco em vez de memória durante o upload.
FILE_UPLOAD_MAX_MEMORY_SIZE = 5 * 1024 * 1024

# ── Logs no stdout (docker compose logs) ─────────────────────────────────────
LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'handlers': {'console': {'class': 'logging.StreamHandler'}},
    'root': {'handlers': ['console'], 'level': 'INFO'},
    'loggers': {
        'django.request': {'handlers': ['console'], 'level': 'WARNING', 'propagate': False},
    },
}
