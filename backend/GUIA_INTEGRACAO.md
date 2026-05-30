# Guia de Integração — Taskie Backend + App Mobile

**Para:** desenvolvedor do app mobile Taskie (Flutter)
**Contexto:** O backend Django foi expandido para suportar as funcionalidades do **zntt-control** (app desktop Kanban). O app mobile Taskie precisa ser atualizado para consumir os novos endpoints e exibir as novas telas.

---

## Índice

1. [O que foi adicionado ao backend](#1-o-que-foi-adicionado-ao-backend)
2. [O que o app mobile precisa ganhar](#2-o-que-o-app-mobile-precisa-ganhar)
3. [Compatibilidade — o que NÃO quebra](#3-compatibilidade--o-que-não-quebra)
4. [Contrato de API Completo](#4-contrato-de-api-completo)
5. [Passo a passo — Backend (rodar localmente)](#5-passo-a-passo--backend-rodar-localmente)
6. [Passo a passo — App Mobile](#6-passo-a-passo--app-mobile)
7. [Modelos de dados novos](#7-modelos-de-dados-novos)
8. [Mapeamento de campos API → Dart](#8-mapeamento-de-campos-api--dart)
9. [Notas de comportamento importantes](#9-notas-de-comportamento-importantes)

---

## 1. O que foi adicionado ao backend

### Novo app: `apps/projects/`

| Model | Campos principais |
|-------|-------------------|
| `Category` | `id` (UUID), `nome`, `criado_por` → User, `criado_em` |
| `Project` | `id` (UUID), `nome`, `cor` (#hex), `logo` (imagem), `categoria` → Category, `status` (ativo/pausado/concluido), `criado_por` → User, `invite_code` (8 chars, único) |
| `Column` | `id` (UUID), `projeto` → Project, `nome`, `posicao` (int), `is_done_column` (bool) |
| `ProjectMember` | `id` (UUID), `projeto` → Project, `usuario` → User, `status` (pending/accepted/rejected) |

### Alterações em `apps/tasks/`

| Model | Novos campos |
|-------|-------------|
| `Task` | `projeto` → Project (null), `coluna` → Column (null), `posicao` (int, default 0) |
| `Subtask` (**novo**) | `id` (UUID), `task` → Task, `titulo`, `concluida` (bool), `posicao` (int) |
| `Attachment` (**novo**) | `id` (UUID), `task` → Task, `arquivo` (FileField), `nome_original`, `mime_type`, `tamanho_bytes` |

### Alterações em `apps/authentication/`

| Model | Campos |
|-------|--------|
| `UserSettings` (**novo**) | `usuario` → User (1:1), `tema` (dark/light), `cor_accent` (#hex) |

---

## 2. O que o app mobile precisa ganhar

O app mobile **continua funcionando sem alterações** para as funcionalidades já existentes. O que é **novo** são telas e fluxos adicionais:

### Novas telas necessárias

| Tela | Descrição | Endpoint principal |
|------|-----------|-------------------|
| **Lista de Projetos** | Exibe todos os projetos do usuário (próprios + compartilhados) | `GET /api/projects/` |
| **Board Kanban** | Colunas + cards de tasks arrastáveis | `GET /api/projects/{id}/board/` |
| **Criar Projeto** | Nome, cor, categoria, definir colunas iniciais | `POST /api/projects/` |
| **Detalhes do Projeto** | Editar nome/cor/logo, ver membros, gerenciar status | `GET/PUT /api/projects/{id}/` |
| **Compartilhar Projeto** | Mostrar invite code, aceitar/rejeitar pedidos | `GET /api/projects/{id}/invite-code/` + `/members/` |
| **Entrar em Projeto** | Digitar código de 8 chars para solicitar acesso | `POST /api/projects/join/` |
| **Gerenciar Categorias** | CRUD de categorias de projeto | `GET/POST/PUT/DELETE /api/categories/` |
| **Detalhes da Task (atualizada)** | Adicionar subtarefas e anexos (já existe, precisa expandir) | `GET /api/tasks/{id}/` |
| **Configurações de UI** | Salvar tema e cor accent | `GET/PUT /api/auth/settings/` |

### Itens a adicionar nas telas existentes

| Tela existente | O que adicionar |
|----------------|-----------------|
| **Detalhes da Task** | Lista de subtarefas (com toggle concluída), lista de anexos (com upload e delete) |
| **Criar Task** | Campos `projeto` e `coluna` (opcionais) para tasks criadas via board |
| **Perfil/Configurações** | Botão para "Entrar em projeto" e configurações de tema |

---

## 3. Compatibilidade — o que NÃO quebra

> **Nenhuma tela existente do app mobile precisa ser alterada para continuar funcionando.**

| Funcionalidade | Status |
|----------------|--------|
| Login/logout/register | ✅ Sem alteração |
| `GET /api/tasks/` — listar tasks | ✅ Sem alteração (tasks sem projeto continuam aparecendo normalmente) |
| `POST /api/tasks/` — criar task | ✅ Os novos campos `projeto`, `coluna`, `posicao` são **opcionais** |
| `PATCH /api/tasks/{id}/` — atualizar task | ✅ Sem alteração (regra de status irreversível mantida para tasks sem coluna) |
| `GET /api/tasks/{id}/history/` | ✅ Sem alteração |
| `GET /api/tasks/stats/` | ✅ Sem alteração |
| Paginação, filtros, ordenação | ✅ Sem alteração |

### O que vai aparecer novo no JSON das tasks

O `TaskSerializer` agora retorna campos adicionais. Para tasks antigas (sem projeto), eles serão `null` ou `[]`:

```json
{
  "id": "...",
  "titulo": "Minha task",
  "status": "backlog",
  ...campos existentes...,

  "projeto": null,
  "coluna": null,
  "posicao": 0,
  "subtarefas": [],
  "anexos": [],
  "subtarefas_total": 0,
  "subtarefas_concluidas": 0
}
```

> Se o modelo Dart usar `@JsonSerializable` com `unknownEnumValue` ou campos anuláveis, esses campos novos **não vão quebrar a desserialização**.

---

## 4. Contrato de API Completo

### Base URL: `http://seu-servidor:8000`
### Auth: `Authorization: Bearer {access_token}`

---

### Autenticação (sem alteração)

| Método | URL | Body | Resposta |
|--------|-----|------|----------|
| `POST` | `/api/auth/login/` | `{username, password}` | `{access, refresh, user}` |
| `POST` | `/api/auth/refresh/` | `{refresh}` | `{access}` |
| `POST` | `/api/auth/logout/` | `{refresh}` | `{message}` |
| `GET`  | `/api/auth/me/` | — | User |
| `POST` | `/api/auth/register/` | `{username, email, password, password_confirm}` | `{user, tokens}` |
| `GET`  | `/api/auth/users/` | — | `[User]` |

### Configurações de UI (novo)

| Método | URL | Body | Resposta |
|--------|-----|------|----------|
| `GET` | `/api/auth/settings/` | — | `{tema, cor_accent, atualizado_em}` |
| `PUT` | `/api/auth/settings/` | `{tema?, cor_accent?}` | `{tema, cor_accent, atualizado_em}` |

---

### Categorias (novo)

| Método | URL | Body | Resposta |
|--------|-----|------|----------|
| `GET` | `/api/categories/` | — | `[Category]` |
| `POST` | `/api/categories/` | `{nome}` | `Category` |
| `PUT` | `/api/categories/{id}/` | `{nome}` | `Category` |
| `DELETE` | `/api/categories/{id}/` | — | 204 (erro 400 se tiver projetos) |

```json
// Category
{
  "id": "uuid",
  "nome": "Pessoal",
  "total_projetos": 3,
  "criado_em": "2025-01-01T00:00:00Z"
}
```

---

### Projetos (novo)

| Método | URL | Body | Resposta |
|--------|-----|------|----------|
| `GET` | `/api/projects/` | — | `[Project]` |
| `POST` | `/api/projects/` | `{nome, cor, categoria?, columns}` | `Project` |
| `GET` | `/api/projects/{id}/` | — | `Project` |
| `PUT` | `/api/projects/{id}/` | `{nome, cor, categoria?}` | `Project` |
| `PATCH` | `/api/projects/{id}/status/` | `{status}` | `Project` |
| `DELETE` | `/api/projects/{id}/` | — | 204 |
| `POST` | `/api/projects/{id}/logo/` | `multipart: logo=<file>` | `Project` |
| `GET` | `/api/projects/{id}/board/` | — | `[ColumnWithTasks]` |
| `PUT` | `/api/projects/{id}/columns/reorder/` | `{ids: [uuid, ...]}` | `{status: "ok"}` |

**POST `/api/projects/` — body:**
```json
{
  "nome": "Meu Projeto",
  "cor": "#7c6af7",
  "categoria": "uuid-da-categoria-ou-null",
  "columns": [
    {"nome": "A Fazer", "posicao": 0, "is_done_column": false},
    {"nome": "Em Progresso", "posicao": 1, "is_done_column": false},
    {"nome": "Concluído", "posicao": 2, "is_done_column": true}
  ]
}
```

**Resposta `Project`:**
```json
{
  "id": "uuid",
  "nome": "Meu Projeto",
  "cor": "#7c6af7",
  "logo": null,
  "logo_url": null,
  "categoria": "uuid-ou-null",
  "categoria_nome": "Pessoal",
  "status": "ativo",
  "total_tasks": 12,
  "done_tasks": 5,
  "criado_em": "2025-01-01T00:00:00Z",
  "atualizado_em": "2025-01-01T00:00:00Z",
  "is_owner": true,
  "invite_code": "A7K2XP9Q",
  "pending_members_count": 1
}
```

> `invite_code` é `null` para membros que não são donos do projeto.
> `pending_members_count` é `0` para membros não-donos.

**GET `/api/projects/{id}/board/` — resposta:**
```json
[
  {
    "id": "uuid-coluna",
    "nome": "A Fazer",
    "posicao": 0,
    "is_done_column": false,
    "tasks": [
      {
        "id": "uuid-task",
        "titulo": "Minha task",
        "descricao": "...",
        "posicao": 0,
        "prioridade": "media",
        "data_limite": null,
        "atribuido_para_username": "joao",
        "subtarefas_total": 2,
        "subtarefas_concluidas": 1,
        "anexos_total": 0,
        "criado_em": "..."
      }
    ]
  }
]
```

---

### Colunas (novo)

| Método | URL | Body | Resposta |
|--------|-----|------|----------|
| `POST` | `/api/columns/` | `{projeto, nome, posicao, is_done_column}` | `Column` |
| `PUT` | `/api/columns/{id}/` | `{nome, is_done_column}` | `Column` |
| `DELETE` | `/api/columns/{id}/` | — | 204 (erro 400 se tiver tasks) |

---

### Compartilhamento de Projetos (novo)

| Método | URL | Body | Resposta |
|--------|-----|------|----------|
| `GET` | `/api/projects/{id}/invite-code/` | — | `{invite_code: "ABCD1234"}` |
| `POST` | `/api/projects/{id}/invite-code/refresh/` | — | `{invite_code: "XYZW5678"}` |
| `POST` | `/api/projects/join/` | `{code: "ABCD1234"}` | `{detail, project_name}` |
| `GET` | `/api/projects/{id}/members/` | — | `[Member]` |
| `POST` | `/api/projects/{id}/accept-member/` | `{user_id: 123}` | `Member` |
| `POST` | `/api/projects/{id}/reject-member/` | `{user_id: 123}` | `{detail}` |
| `POST` | `/api/projects/{id}/remove-member/` | `{user_id: 123}` | 204 |

**Member:**
```json
{
  "id": "uuid",
  "usuario": 123,
  "username": "joao",
  "email": "joao@email.com",
  "status": "pending",
  "criado_em": "..."
}
```

**Status possíveis do membro:** `pending` | `accepted` | `rejected`

**Fluxo de compartilhamento:**
```
Dono: GET /invite-code/ → mostra código "A7K2XP9Q"
Outro usuário: POST /join/ com {code: "A7K2XP9Q"} → status: pending
Dono: GET /members/ → vê o pedido
Dono: POST /accept-member/ com {user_id: X} → membro pode ver o projeto
```

---

### Tasks — campos novos no response

O response de `GET /api/tasks/` e `GET /api/tasks/{id}/` agora inclui:

```json
{
  ...campos anteriores...,
  "projeto": "uuid-ou-null",
  "coluna": "uuid-ou-null",
  "posicao": 0,
  "subtarefas": [...],
  "anexos": [...],
  "subtarefas_total": 2,
  "subtarefas_concluidas": 1
}
```

**Filtros novos disponíveis em `GET /api/tasks/`:**
- `?projeto=uuid` — tasks de um projeto específico
- `?coluna=uuid` — tasks de uma coluna específica

**Mover task entre colunas:**
```
POST /api/tasks/{id}/move/
Body: { "coluna_id": "uuid", "posicao": 2 }
```

---

### Subtarefas (novo)

| Método | URL | Body | Resposta |
|--------|-----|------|----------|
| `POST` | `/api/subtasks/` | `{task: "uuid", titulo, posicao?}` | `Subtask` |
| `POST` | `/api/subtasks/{id}/toggle/` | — | `Subtask` (concluida alternado) |
| `DELETE` | `/api/subtasks/{id}/` | — | 204 |

```json
// Subtask
{
  "id": "uuid",
  "task": "uuid-da-task",
  "titulo": "Subtarefa 1",
  "concluida": false,
  "posicao": 0,
  "criado_em": "..."
}
```

---

### Anexos (novo)

| Método | URL | Body | Resposta |
|--------|-----|------|----------|
| `POST` | `/api/attachments/` | `multipart: task=uuid, arquivo=<file>` | `Attachment` |
| `DELETE` | `/api/attachments/{id}/` | — | 204 |

```json
// Attachment
{
  "id": "uuid",
  "task": "uuid-da-task",
  "arquivo": "/media/tasks/attachments/2025/01/arquivo.pdf",
  "arquivo_url": "http://servidor/media/tasks/attachments/2025/01/arquivo.pdf",
  "nome_original": "arquivo.pdf",
  "mime_type": "application/pdf",
  "tamanho_bytes": 204800,
  "criado_em": "..."
}
```

---

## 5. Passo a passo — Backend (rodar localmente)

```bash
# 1. Clonar e entrar no backend
cd backend

# 2. Instalar dependências
pip install -r requirements.txt

# 3. Copiar .env
copy .env.example .env
# Editar .env com as credenciais do banco se necessário

# 4. Criar usuário e banco PostgreSQL (se não existir)
psql -U postgres -c "CREATE USER taskie WITH PASSWORD 'taskie';"
psql -U postgres -c "CREATE DATABASE taskie OWNER taskie;"

# 5. Criar e aplicar migrações
python manage.py makemigrations projects authentication tasks
python manage.py migrate

# 6. Criar superusuário (opcional)
python manage.py createsuperuser

# 7. Rodar o servidor
python manage.py runserver

# Documentação Swagger disponível em:
# http://localhost:8000/api/docs/
```

---

## 6. Passo a passo — App Mobile

### Fase 1 — Modelos Dart

Criar/atualizar os modelos Dart para os novos recursos:

#### `Project` (novo)
```dart
class Project {
  final String id;
  final String nome;
  final String cor;
  final String? logoUrl;
  final String? categoriaId;
  final String? categoriaNome;
  final String status; // 'ativo' | 'pausado' | 'concluido'
  final int totalTasks;
  final int doneTasks;
  final bool isOwner;
  final String? inviteCode; // null se não for dono
  final int pendingMembersCount;
  final DateTime criadoEm;
}
```

#### `ProjectColumn` (novo — evitar conflito com `Column` do Flutter)
```dart
class ProjectColumn {
  final String id;
  final String projetoId; // NÃO vem no endpoint de board — preencher com o ID do projeto atual (já disponível na tela)
  final String nome;
  final int posicao;
  final bool isDoneColumn;
  final List<TaskCard> tasks; // usado no board
}
```

> **Atenção:** `GET /api/projects/{id}/board/` retorna colunas sem o campo `projeto`. O `projetoId` deve ser populado a partir do ID do projeto que já está carregado na tela — não tente lê-lo do JSON do board.

#### `TaskCard` (novo — versão compacta para o board)
```dart
class TaskCard {
  final String id;
  final String titulo;
  final String? descricao;
  final int posicao;
  final String prioridade;
  final DateTime? dataLimite;
  final String? atribuidoParaUsername;
  final int subtarefasTotal;
  final int subtarefasConcluidas;
  final int anexosTotal;
}
```

#### `Subtask` (novo)
```dart
class Subtask {
  final String id;
  final String taskId;
  final String titulo;
  final bool concluida;
  final int posicao;
}
```

#### `Attachment` (novo)
```dart
class Attachment {
  final String id;
  final String taskId;
  final String arquivoUrl;
  final String nomeOriginal;
  final String? mimeType;
  final int? tamanhoBytes;
}
```

#### `Category` (novo)
```dart
class Category {
  final String id;
  final String nome;
  final int totalProjetos;
}
```

#### `ProjectMember` (novo)
```dart
class ProjectMember {
  final String id;
  final int usuarioId;
  final String username;
  final String email;
  final String status; // 'pending' | 'accepted' | 'rejected'
}
```

#### Atualizar `Task` (existente)
Adicionar os campos opcionais ao modelo existente:
```dart
class Task {
  // ...campos existentes...
  final String? projetoId;        // novo, nullable
  final String? colunaId;         // novo, nullable
  final int posicao;              // novo, default 0
  final List<Subtask> subtarefas; // novo, default []
  final List<Attachment> anexos;  // novo, default []
  final int subtarefasTotal;      // novo
  final int subtarefasConcluidas; // novo
}
```

---

### Fase 2 — Serviços/Repositórios Dart

Criar um `ProjectService` (ou equivalente ao padrão do projeto):

```dart
// Endpoints a implementar:
Future<List<Project>> getProjects();
Future<Project> getProject(String id);
Future<Project> createProject(Map<String, dynamic> data);
Future<Project> updateProject(String id, Map<String, dynamic> data);
Future<void> updateStatus(String id, String status);
Future<void> deleteProject(String id);
Future<Project> uploadLogo(String id, File logo);
Future<List<ProjectColumn>> getBoard(String id);
Future<void> reorderColumns(String id, List<String> columnIds);

// Compartilhamento
Future<String> getInviteCode(String id);
Future<String> refreshInviteCode(String id);
Future<Map> joinProject(String code);
Future<List<ProjectMember>> getMembers(String id);
Future<void> acceptMember(String id, int userId);
Future<void> rejectMember(String id, int userId);
Future<void> removeMember(String id, int userId);
```

Criar `CategoryService`:
```dart
Future<List<Category>> getCategories();
Future<Category> createCategory(String nome);
Future<Category> updateCategory(String id, String nome);
Future<void> deleteCategory(String id);
```

Criar `SubtaskService`:
```dart
Future<Subtask> create(String taskId, String titulo, {int posicao = 0});
Future<Subtask> toggle(String id);
Future<void> delete(String id);
```

Criar `AttachmentService`:
```dart
Future<Attachment> upload(String taskId, File arquivo);
Future<void> delete(String id);
```

Atualizar `TaskService` — adicionar:
```dart
Future<Task> moveTask(String taskId, String colunaId, int posicao);
```

---

### Fase 3 — Novas Telas

#### 3.1 Tela: Lista de Projetos

**Elementos:**
- Lista de cards de projeto (nome, cor, progresso, status)
- Botão "Novo Projeto"
- Botão "Entrar em projeto" (abre o fluxo de join via código)
- Badge de notificação nos projetos com pedidos pendentes (`pending_members_count > 0`)
- Filtros por categoria e status

**Ações:**
- Toque no card → abre o Board Kanban
- Botão de compartilhar (ícone) → abre tela de compartilhamento
- Swipe ou menu → pausar, concluir, deletar

---

#### 3.2 Tela: Board Kanban

**Elementos:**
- Colunas horizontais (scroll horizontal)
- Cards de task em cada coluna (scroll vertical)
- Botão "+" em cada coluna para criar task
- Indicadores de subtarefas e anexos nos cards

**Drag-and-drop (opcional no mobile, mas recomendado):**
- Arrastar card entre colunas → chamar `POST /tasks/{id}/move/`

**Ações:**
- Toque no card → abre Detalhes da Task
- Botão "Editar coluna" → modal para renomear
- Botão "Nova coluna" → cria coluna
- Segurar coluna → reordenar colunas

---

#### 3.3 Tela: Criar/Editar Projeto

**Campos:**
- Nome (obrigatório)
- Cor (color picker — 8 opções)
- Categoria (dropdown das categorias do usuário, opcional)
- Logo (upload de imagem, opcional)
- Colunas iniciais (lista editável — ao criar; ao editar ficam em tela separada)
  - Cada coluna: nome + toggle "é a coluna de concluído?"
  - Exatamente 1 coluna deve ser marcada como "done"

---

#### 3.4 Tela: Compartilhar Projeto (Dono)

**Elementos:**
- Código de convite grande e copiável (ex: `A7K2XP9Q`)
- Botão "Gerar novo código" (invalida o anterior)
- Seção "Pedidos pendentes" com Accept/Reject por usuário
- Seção "Membros" com lista e opção de remover

---

#### 3.5 Tela: Entrar em Projeto

**Elementos:**
- Campo de texto para o código de 8 chars
- Botão "Enviar pedido"
- Feedback: "Pedido enviado para X. Aguarde aprovação."

---

#### 3.6 Tela: Detalhes da Task (expandida)

Adicionar às seções já existentes:

**Subtarefas:**
- Lista de subtarefas com checkbox de conclusão
- Campo para adicionar nova subtarefa
- Botão de deletar por subtarefa
- Contador "2/5 concluídas"

**Anexos:**
- Lista com nome, tamanho e tipo do arquivo
- Botão de upload (galeria ou câmera)
- Botão de deletar por anexo
- Toque para abrir/baixar o arquivo (usar `arquivo_url`)

---

#### 3.7 Tela: Gerenciar Categorias

**Elementos:**
- Lista de categorias com total de projetos
- Adicionar/renomear/deletar categoria
- Aviso ao tentar deletar categoria com projetos

---

#### 3.8 Tela: Configurações (expandida)

Adicionar à tela já existente:
- Seletor de tema (dark/light)
- Seletor de cor accent
- Botão "Entrar em projeto compartilhado" (alternativo ao da lista de projetos)

---

## 7. Modelos de dados novos

### Regras de negócio importantes

#### Status da Task × Coluna
- Task **sem coluna** (`coluna = null`): campo `status` funciona exatamente como antes (`backlog` / `em_andamento` / `concluido`). Regra de irreversibilidade de "concluído" mantida.
- Task **com coluna**: `status` é derivado automaticamente de `is_done_column`. Se a coluna é "done", a task fica `concluido`. Se não, fica `em_andamento`. A regra de irreversibilidade **não se aplica**.

#### Invite Code
- Gerado automaticamente na criação do projeto (8 chars, uppercase alfanumérico: `A-Z0-9`)
- Único no banco. Se `refresh_invite_code` for chamado, todos os pedidos `pending` são automaticamente `rejected`.
- Só é visível no response de projetos para o **dono** (`is_owner: true`). Para membros, retorna `null`.

#### Visibilidade de projetos
- `GET /api/projects/` retorna tanto projetos do usuário quanto projetos em que ele é membro aceito (`status: accepted`).
- Um membro aceito pode ver o board e criar/editar tasks, mas **não pode** editar o projeto, gerenciar membros, ver/alterar o código de convite ou deletar o projeto.

#### Upload de logo
- Enviar como `multipart/form-data` com campo `logo`.
- A URL do logo estará em `logo_url` no response do projeto.

---

## 8. Mapeamento de campos API → Dart

| Campo JSON (backend) | Tipo JSON | Campo Dart sugerido |
|----------------------|-----------|---------------------|
| `nome` | string | `nome` |
| `cor` | string `#rrggbb` | `cor` → parsear com `Color(int.parse('0xFF' + cor.substring(1)))` |
| `logo_url` | string? | `logoUrl` |
| `categoria` | UUID string? | `categoriaId` |
| `categoria_nome` | string? | `categoriaNome` |
| `is_done_column` | bool | `isDoneColumn` |
| `is_owner` | bool | `isOwner` |
| `invite_code` | string? | `inviteCode` |
| `pending_members_count` | int | `pendingMembersCount` |
| `total_tasks` | int | `totalTasks` |
| `done_tasks` | int | `doneTasks` |
| `criado_em` | ISO 8601 string | `criadoEm` → `DateTime.parse(...)` |
| `atualizado_em` | ISO 8601 string | `atualizadoEm` |
| `atribuido_para_username` | string? | `atribuidoParaUsername` |
| `subtarefas_total` | int | `subtarefasTotal` |
| `subtarefas_concluidas` | int | `subtarefasConcluidas` |
| `anexos_total` | int | `anexosTotal` |
| `nome_original` | string | `nomeOriginal` |
| `mime_type` | string? | `mimeType` |
| `tamanho_bytes` | int? | `tamanhoBytes` |
| `arquivo_url` | string | `arquivoUrl` |

---

## 9. Notas de comportamento importantes

### Autenticação JWT
- O token é enviado no header: `Authorization: Bearer {access_token}`
- Access token expira em **60 minutos**
- Refresh token expira em **7 dias**
- Ao receber `401`, usar `POST /api/auth/refresh/` com o `refresh_token` para obter novo `access`
- O refresh token antigo é invalidado quando `BLACKLIST_AFTER_ROTATION=True` (verificar config atual)

### IDs
- Todos os IDs de modelos principais são **UUID** (string no JSON)
- O ID do usuário (`criado_por`, `atribuido_para`) é **inteiro** (padrão do `auth.User` do Django)

### Paginação
- **Somente `GET /api/tasks/`** usa paginação por página
- Response paginado: `{"count": 100, "next": "url?page=2", "previous": null, "results": [...]}`
- Parâmetro: `?page=2`
- `GET /api/projects/`, `GET /api/categories/` e `GET /api/columns/` retornam **arrays diretos** (sem wrapper de paginação)

### Erros comuns

| Código | Situação |
|--------|----------|
| `400` | Validação falhou — ler campo `detail` ou campos específicos |
| `401` | Token expirado ou inválido — renovar com refresh |
| `403` | Operação não permitida para o usuário atual (ex: membro tentando editar projeto) |
| `404` | Recurso não encontrado |

### Upload de arquivos
- Sempre usar `Content-Type: multipart/form-data`
- Logo do projeto: campo `logo` em `POST /api/projects/{id}/logo/`
- Anexo de task: campos `task` (UUID da task) e `arquivo` (arquivo) em `POST /api/attachments/`

### Ordenação no board
- As tasks dentro de cada coluna chegam ordenadas por `posicao` (crescente)
- As colunas chegam ordenadas por `posicao` (crescente)
- Ao mover uma task, o backend reposiciona automaticamente as demais tasks da coluna de origem e destino

---

## Checklist — App Mobile

### Modelos
- [ ] Criar model `Project`
- [ ] Criar model `ProjectColumn`
- [ ] Criar model `TaskCard` (versão compacta para board)
- [ ] Criar model `Subtask`
- [ ] Criar model `Attachment`
- [ ] Criar model `Category`
- [ ] Criar model `ProjectMember`
- [ ] Atualizar model `Task` com campos novos (todos opcionais/com default)

### Serviços/Repositórios
- [ ] Criar `ProjectService` (CRUD + board + compartilhamento)
- [ ] Criar `CategoryService`
- [ ] Criar `SubtaskService`
- [ ] Criar `AttachmentService`
- [ ] Atualizar `TaskService` — adicionar `moveTask()`

### Telas
- [ ] Tela: Lista de Projetos
- [ ] Tela: Board Kanban
- [ ] Tela: Criar/Editar Projeto (com setup de colunas)
- [ ] Tela: Compartilhar Projeto (dono)
- [ ] Tela: Entrar em Projeto (via código)
- [ ] Tela: Detalhes da Task — seção de Subtarefas
- [ ] Tela: Detalhes da Task — seção de Anexos
- [ ] Tela: Gerenciar Categorias
- [ ] Tela: Configurações — tema e cor accent
