# Documentação Técnica — Backend

## Estrutura de pastas

```
backend/
├── apps/
│   ├── core/
│   │   ├── models.py        # BaseModel com id UUID, criado_em, atualizado_em
│   │   ├── mixins.py        # ActionSerializerMixin
│   │   └── pagination.py    # CustomPageNumberPagination
│   ├── authentication/
│   │   ├── serializers.py   # UserSerializer, UserSummarySerializer
│   │   ├── views.py         # MeView, UsersListView
│   │   └── urls.py
│   └── tasks/
│       ├── models.py        # Task, TaskHistory
│       ├── serializers.py   # TaskSerializer, TaskCreateSerializer, TaskUpdateSerializer, TaskHistorySerializer
│       ├── views.py         # TaskViewSet
│       ├── filters.py       # TaskFilter
│       ├── permissions.py   # IsOwnerOrReadOnly
│       └── urls.py
├── config/
│   ├── settings/
│   │   ├── base.py          # Configurações compartilhadas
│   │   ├── development.py   # DEBUG=True, CORS liberado
│   │   └── production.py    # DEBUG=False, headers de segurança
│   └── urls.py
├── Dockerfile
├── docker-compose.yml
├── requirements.txt
└── seed.py
```

---

## Modelos

### Task

| Campo | Tipo | Detalhes |
|---|---|---|
| `id` | UUID | Gerado automaticamente (herda de `BaseModel`) |
| `titulo` | CharField(255) | Obrigatório |
| `descricao` | TextField | Opcional |
| `status` | CharField | `backlog` / `em_andamento` / `concluido` |
| `prioridade` | CharField | `baixa` / `media` / `alta` |
| `criado_por` | FK → User | Preenchido automaticamente, imutável via API |
| `atribuido_para` | FK → User | Opcional, `SET_NULL` ao deletar usuário |
| `data_limite` | DateTimeField | Opcional |
| `criado_em` | DateTimeField | Auto — herda de `BaseModel` |
| `atualizado_em` | DateTimeField | Auto — herda de `BaseModel` |

Índices compostos para performance nas queries mais frequentes: `(status, -criado_em)`, `(criado_por, -criado_em)`, `(atribuido_para, -criado_em)`.

### TaskHistory

Registra cada alteração campo a campo em uma `Task`.

| Campo | Tipo | Detalhes |
|---|---|---|
| `task` | FK → Task | `CASCADE` — histórico removido junto com a tarefa |
| `field_name` | CharField(50) | Nome do campo alterado |
| `old_value` | TextField | Valor anterior (string) |
| `new_value` | TextField | Novo valor (string) |
| `changed_by` | FK → User | Usuário que realizou a alteração |
| `changed_at` | DateTimeField | Timestamp automático |

---

## Regras de negócio

- Somente o criador da tarefa pode editá-la ou removê-la (`IsOwnerOrReadOnly`)
- O campo `criado_por` é preenchido automaticamente e não pode ser alterado via API
- A transição de `concluido` para qualquer outro status não é permitida
- Qualquer usuário autenticado pode visualizar todas as tarefas
- `atribuido_para` só aceita usuários ativos
- `data_limite` não pode ser uma data no passado

---

## Serializers

O `TaskViewSet` usa serializers diferentes por action via `ActionSerializerMixin`:

| Action | Serializer | Campos aceitos |
|---|---|---|
| `list`, `retrieve` | `TaskSerializer` | Todos os campos + `can_edit`, usernames resolvidos |
| `create` | `TaskCreateSerializer` | `titulo`, `descricao`, `prioridade`, `atribuido_para`, `data_limite` |
| `update`, `partial_update` | `TaskUpdateSerializer` | `titulo`, `descricao`, `status`, `prioridade`, `atribuido_para`, `data_limite` |

O campo `can_edit` (booleano) é calculado no `TaskSerializer` e indica se o usuário autenticado na requisição é o criador da tarefa — usado pelo app mobile para exibir ou ocultar as ações de edição e exclusão.

---

## Filtros e ordenação

Endpoint: `GET /api/tarefas/`

| Parâmetro | Tipo | Exemplo |
|---|---|---|
| `status` | exact | `?status=backlog` |
| `prioridade` | exact | `?prioridade=alta` |
| `titulo` | icontains | `?titulo=relatório` |
| `descricao` | icontains | `?descricao=urgente` |
| `criado_por` | id | `?criado_por=1` |
| `atribuido_para` | id | `?atribuido_para=2` |
| `criado_em_inicio` | datetime ≥ | `?criado_em_inicio=2026-01-01` |
| `criado_em_fim` | datetime ≤ | `?criado_em_fim=2026-12-31` |
| `data_limite_inicio` | datetime ≥ | `?data_limite_inicio=2026-03-01` |
| `data_limite_fim` | datetime ≤ | `?data_limite_fim=2026-03-31` |
| `ordering` | campo | `?ordering=-criado_em` ou `?ordering=data_limite` |

Campos de ordenação disponíveis: `criado_em`, `atualizado_em`, `data_limite`, `titulo`.

Paginação: `page` e `page_size` (padrão: 20 itens por página).

---

## Histórico de alterações

O registro do histórico é feito via override do `save()` no modelo `Task`. Antes de persistir, o método busca o estado atual no banco e compara campo a campo com os novos valores, criando um `TaskHistory` para cada campo que mudou.

O usuário responsável é injetado pelo `TaskViewSet` via `instance._history_user = request.user` antes do `serializer.save()`. Campos rastreados: `titulo`, `descricao`, `status`, `prioridade`, `atribuido_para`, `data_limite`.

Para evitar falsos positivos com campos `datetime` causados por diferença de timezone entre Python e PostgreSQL, os valores são normalizados para UTC antes da comparação via `_normalize_for_comparison`.

---

## Autenticação JWT

Configurado com `djangorestframework-simplejwt`:

- **Access token**: 60 minutos
- **Refresh token**: 7 dias
- **Blacklist**: ativado — o logout invalida o refresh token
- **Rotate refresh tokens**: desabilitado

O header esperado em todas as requisições autenticadas: `Authorization: Bearer <access_token>`.
