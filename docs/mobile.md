# Documentação Técnica — Mobile

## Estrutura de pastas

```
mobile/lib/
├── core/
│   ├── config/
│   │   └── app_env.dart          # Leitura do .env (API_BASE_URL)
│   ├── di/
│   │   └── service_locator.dart  # Injeção de dependência com get_it
│   ├── errors/
│   │   └── failures.dart         # Tipos de falha (ServerFailure, NetworkFailure...)
│   ├── network/
│   │   ├── api_client.dart       # Instância do Dio configurada
│   │   ├── api_endpoints.dart    # Constantes de URL
│   │   └── interceptors.dart     # AuthInterceptor, ErrorInterceptor
│   ├── router/
│   │   └── app_router.dart       # GoRouter com redirect reativo ao AuthBloc
│   ├── storage/
│   │   └── secure_storage.dart   # flutter_secure_storage (access/refresh token)
│   ├── theme/
│   │   └── material_theme.dart   # Material 3 theme
│   └── utils/
│       └── typedef.dart          # Either<Failure, T>
├── features/
│   ├── authentication/
│   │   ├── domain/
│   │   │   ├── entities/         # User, UserSummary
│   │   │   ├── repositories/     # AuthRepository (contrato)
│   │   │   └── usecases/         # Login, Logout, GetCurrentUser
│   │   ├── data/
│   │   │   ├── models/           # UserModel (Freezed + JsonSerializable)
│   │   │   ├── datasources/      # AuthRemoteDatasource
│   │   │   └── repositories/     # AuthRepositoryImpl
│   │   └── presentation/
│   │       ├── bloc/             # AuthBloc (events + states + bloc)
│   │       ├── cubit/            # UsersCubit (lista de usuários para atribuição)
│   │       └── pages/            # LoginPage
│   └── tasks/
│       ├── domain/
│       │   ├── entities/         # Task, TaskHistory
│       │   ├── repositories/     # TaskRepository (contrato)
│       │   └── usecases/         # GetTasks, CreateTask, UpdateTask, DeleteTask, GetTaskHistory
│       ├── data/
│       │   ├── models/           # TaskModel, TaskHistoryModel (Freezed + JsonSerializable)
│       │   ├── datasources/      # TaskRemoteDatasource
│       │   └── repositories/     # TaskRepositoryImpl
│       └── presentation/
│           ├── bloc/
│           │   ├── task_list/    # TaskListBloc
│           │   ├── task_detail/  # TaskDetailBloc
│           │   ├── task_form/    # TaskFormBloc
│           │   └── task_history/ # TaskHistoryBloc
│           ├── pages/            # TaskListPage, TaskDetailPage, TaskFormPage, TaskHistoryPage
│           └── widgets/
│               ├── common/       # TaskStatusBadge, TaskPriorityBadge, TaskStatusPicker
│               ├── list/         # TaskCard, FilterBottomSheet, TaskFilterTabs, skeletons
│               ├── detail/       # TaskDetailHeader, TaskDetailTabs, HistoryItem, skeletons
│               └── form/         # TaskFormWidget, TaskFormSelectors, TaskFormHelpers
└── shared/
    ├── extensions/               # DateTimeExtensions
    └── widgets/                  # AppTextField, AppPrimaryButton, AppSnackbar, etc.
```

---

## Camadas — Clean Architecture

### Domain

Não depende de Flutter nem de pacotes externos. Define os contratos e entidades puras.

- **Entidades**: `Task` e `TaskHistory` são classes Dart com `Equatable`. `Task` carrega o campo `canEdit` (bool) vindo da API para controle de permissão no UI.
- **Repositórios**: interfaces abstratas (`AuthRepository`, `TaskRepository`) que a camada data implementa.
- **Use cases**: cada operação é uma classe com método `call`. Retornam `Either<Failure, T>` — `Left` para erros, `Right` para sucesso.

### Data

Implementa os contratos do domain.

- **Models**: `TaskModel` e `UserModel` usam `Freezed` + `JsonSerializable`. O `toEntity()` converte o model para entidade do domain. Datas são convertidas para timezone local via `.toLocal()` ao mapear para entidade.
- **Datasources**: fazem as chamadas HTTP via `Dio` e lançam exceções em caso de erro.
- **Repositories**: capturam exceções do datasource e retornam `Either<Failure, T>`.

### Presentation

BLoCs recebem eventos, acionam use cases e emitem estados. Widgets consomem os estados via `BlocBuilder` / `BlocListener`.

---

## BLoCs

### AuthBloc

Registrado como **singleton** no `get_it` para que o `AuthInterceptor` consiga disparar `sessionExpired` de qualquer ponto da aplicação.

**Eventos:**
| Evento | Descrição |
|---|---|
| `checkRequested` | Verifica token salvo ao abrir o app |
| `loginRequested(username, password)` | Realiza login |
| `logoutRequested` | Faz logout e invalida o refresh token |
| `sessionExpired` | Disparado pelo interceptor quando o refresh falha |

**Estados:**
| Estado | Descrição |
|---|---|
| `initial` | Estado inicial antes da verificação |
| `loading` | Operação em andamento |
| `authenticated(User)` | Usuário autenticado |
| `unauthenticated` | Não autenticado (logout limpo) |
| `sessionExpired` | Sessão expirada por refresh inválido |
| `failure(message)` | Erro de login |

---

### TaskListBloc

**Eventos:**
| Evento | Descrição |
|---|---|
| `loaded` | Carrega a lista |
| `refreshed` | Recarrega (pull-to-refresh) |
| `filtered(status?)` | Filtra por status (`null` = todos) |
| `taskDeleted(id)` | Remove localmente após delete bem-sucedido |

**Estados:**
| Estado | Descrição |
|---|---|
| `initial` | Antes do primeiro carregamento |
| `loading` | Carregando |
| `success(tasks, filterStatus?)` | Lista carregada com filtro atual |
| `failure(message)` | Erro |

---

### TaskDetailBloc

**Eventos:** `loaded(taskId)`, `refreshed`

**Estados:** `initial`, `loading`, `success(Task)`, `failure(message)`

---

### TaskFormBloc

Unifica criação e edição. Se `initialTask` vier preenchido no evento, faz `update`; caso contrário, faz `create`.

**Evento:** `submitted(initialTask?, titulo, descricao, status, prioridade, atribuidoPara?, dataLimite?)`

**Estados:** `initial`, `loading`, `success(Task)`, `failure(message)`

---

### TaskHistoryBloc

**Evento:** `loaded(taskId)`

**Estados:** `initial`, `loading`, `success(List<TaskHistory>)`, `failure(message)`

---

### UsersCubit

Registrado como **factory** no `get_it` — nova instância por uso. Carrega a lista de usuários para o seletor de atribuição no formulário.

**Estados:** `initial`, `loading`, `loaded(List<UserSummary>)`, `failure(message)`

---

## Injeção de dependência — get_it

Ordem de registro em `service_locator.dart`:

1. `SecureStorage` — singleton
2. `AuthBloc` — singleton (necessário antes do `ApiClient` para o callback `onLogout`)
3. `ApiClient` — singleton, recebe `onLogout: () => getIt<AuthBloc>().add(AuthEvent.sessionExpired())`
4. `Dio` — singleton, exposto pelo `ApiClient`
5. Datasources — singletons
6. Repositories — singletons
7. Use cases — singletons
8. `UsersCubit` — factory

---

## Navegação — GoRouter

O router é criado com `refreshListenable` apontando para um stream do `AuthBloc`. A cada mudança de estado do bloc, o GoRouter reavalia o redirect automaticamente.

**Rotas:**

| Rota | Página |
|---|---|
| `/login` | `LoginPage` |
| `/tasks` | `TaskListPage` |
| `/tasks/create` | `TaskFormPage` |
| `/tasks/:id` | `TaskDetailPage` |
| `/tasks/:id/edit` | `TaskFormPage` (com `initialTask` via `extra`) |
| `/tasks/:id/history` | `TaskHistoryPage` |

**Lógica de redirect:**

- Se `AuthState` for `initial` ou `loading`: sem redirect (aguarda)
- Se não autenticado ou `sessionExpired` e não estiver em `/login`: redireciona para `/login`
- Se autenticado e estiver em `/login`: redireciona para `/tasks`

---

## Camada de rede

### AuthInterceptor

Injeta o `Authorization: Bearer <token>` em todas as requisições, exceto `/auth/login/` e `/auth/refresh/`.

Ao receber `401`:
1. Busca o refresh token no `SecureStorage`
2. Tenta renovar via `/auth/refresh/` usando uma instância separada do Dio (evita loop infinito)
3. Marca a requisição com `extra['_retry'] = true` antes de retentar (proteção adicional contra loop)
4. Se o refresh falhar: limpa os tokens e chama `onLogout()`, que dispara `AuthEvent.sessionExpired()` no `AuthBloc`

### ErrorInterceptor

Padroniza mensagens de erro de rede (`connectionTimeout`, `connectionError`, `badResponse`) antes de propagar a exceção.

---

## Geração de código

Os arquivos `.freezed.dart` e `.g.dart` são gerados pelo `build_runner` e estão commitados no repositório.

Para regenerar após alterações em models, events ou states:

```bash
cd mobile
flutter pub run build_runner build --delete-conflicting-outputs
```
