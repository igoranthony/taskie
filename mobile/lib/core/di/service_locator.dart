import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../network/api_client.dart';
import '../storage/secure_storage.dart';
import '../../features/authentication/data/datasources/auth_remote_datasource.dart';
import '../../features/authentication/data/repositories/auth_repository_impl.dart';
import '../../features/authentication/domain/repositories/auth_repository.dart';
import '../../features/authentication/domain/usecases/login.dart';
import '../../features/authentication/domain/usecases/logout.dart';
import '../../features/authentication/domain/usecases/get_current_user.dart';
import '../../features/authentication/presentation/bloc/auth_bloc.dart';
import '../../features/authentication/presentation/bloc/auth_event.dart';
import '../../features/authentication/presentation/cubit/users_cubit.dart';
import '../../features/authentication/presentation/cubit/user_settings_cubit.dart';
import '../../features/authentication/data/datasources/settings_remote_datasource.dart';
import '../../features/authentication/data/repositories/settings_repository_impl.dart';
import '../../features/authentication/domain/repositories/settings_repository.dart';
import '../../features/authentication/domain/usecases/settings_use_cases.dart';
import '../../features/tasks/data/datasources/task_remote_datasource.dart';
import '../../features/tasks/data/repositories/task_repository_impl.dart';
import '../../features/tasks/domain/repositories/task_repository.dart';
import '../../features/tasks/domain/usecases/get_tasks.dart';
import '../../features/tasks/domain/usecases/create_task.dart';
import '../../features/tasks/domain/usecases/update_task.dart';
import '../../features/tasks/domain/usecases/delete_task.dart';
import '../../features/tasks/domain/usecases/get_task_history.dart';
import '../../features/tasks/domain/usecases/move_task.dart';
import '../../features/tasks/data/datasources/subtask_remote_datasource.dart';
import '../../features/tasks/data/datasources/attachment_remote_datasource.dart';
import '../../features/tasks/data/repositories/subtask_repository_impl.dart';
import '../../features/tasks/data/repositories/attachment_repository_impl.dart';
import '../../features/tasks/domain/repositories/subtask_repository.dart';
import '../../features/tasks/domain/repositories/attachment_repository.dart';
import '../../features/tasks/domain/usecases/create_subtask.dart';
import '../../features/tasks/domain/usecases/toggle_subtask.dart';
import '../../features/tasks/domain/usecases/delete_subtask.dart';
import '../../features/tasks/domain/usecases/upload_attachment.dart';
import '../../features/tasks/domain/usecases/delete_attachment.dart';
import '../../features/projects/data/datasources/project_remote_datasource.dart';
import '../../features/projects/data/repositories/project_repository_impl.dart';
import '../../features/projects/domain/repositories/project_repository.dart';
import '../../features/projects/domain/usecases/get_projects.dart';
import '../../features/projects/domain/usecases/get_project.dart';
import '../../features/projects/domain/usecases/create_project.dart';
import '../../features/projects/domain/usecases/update_project.dart';
import '../../features/projects/domain/usecases/update_project_status.dart';
import '../../features/projects/domain/usecases/delete_project.dart';
import '../../features/projects/domain/usecases/get_project_columns.dart';
import '../../features/projects/domain/usecases/upload_project_logo.dart';
import '../../features/projects/data/datasources/category_remote_datasource.dart';
import '../../features/projects/data/repositories/category_repository_impl.dart';
import '../../features/projects/domain/repositories/category_repository.dart';
import '../../features/projects/domain/usecases/get_categories.dart';
import '../../features/projects/domain/usecases/create_category.dart';
import '../../features/projects/domain/usecases/update_category.dart';
import '../../features/projects/domain/usecases/delete_category.dart';
import '../../features/projects/data/datasources/project_share_remote_datasource.dart';
import '../../features/projects/data/repositories/project_share_repository_impl.dart';
import '../../features/projects/domain/repositories/project_share_repository.dart';
import '../../features/projects/domain/usecases/share_use_cases.dart';
import '../../features/projects/data/datasources/column_remote_datasource.dart';
import '../../features/projects/data/repositories/column_repository_impl.dart';
import '../../features/projects/domain/repositories/column_repository.dart';
import '../../features/projects/domain/usecases/column_use_cases.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Core
  getIt.registerLazySingleton<SecureStorage>(() => SecureStorage());
  getIt.registerLazySingleton<ApiClient>(
    () => ApiClient(
      storage: getIt<SecureStorage>(),
      onLogout: () => getIt<AuthBloc>().add(const AuthEvent.sessionExpired()),
    ),
  );
  getIt.registerLazySingleton<Dio>(() => getIt<ApiClient>().dio);

  // Auth - Data
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      dio: getIt<Dio>(),
      secureStorage: getIt<SecureStorage>(),
    ),
  );
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: getIt<AuthRemoteDataSource>(),
      secureStorage: getIt<SecureStorage>(),
    ),
  );

  // Auth - Use Cases
  getIt.registerLazySingleton(() => Login(getIt<AuthRepository>()));
  getIt.registerLazySingleton(() => Logout(getIt<AuthRepository>()));
  getIt.registerLazySingleton(() => GetCurrentUser(getIt<AuthRepository>()));

  // Auth - Bloc (singleton para o interceptor disparar sessionExpired)
  getIt.registerLazySingleton<AuthBloc>(
    () => AuthBloc(
      authRepository: getIt<AuthRepository>(),
      login: getIt<Login>(),
      logout: getIt<Logout>(),
      getCurrentUser: getIt<GetCurrentUser>(),
    ),
  );

  // Users Cubit (factory = nova instância por página)
  getIt.registerFactory(() => UsersCubit(getIt<Dio>()));

  // User Settings (tema + cor accent) — singleton global
  getIt.registerLazySingleton<SettingsRemoteDataSource>(
    () => SettingsRemoteDataSourceImpl(dio: getIt<Dio>()),
  );
  getIt.registerLazySingleton<SettingsRepository>(
    () => SettingsRepositoryImpl(
      remoteDataSource: getIt<SettingsRemoteDataSource>(),
    ),
  );
  getIt.registerLazySingleton(() => GetUserSettings(getIt<SettingsRepository>()));
  getIt.registerLazySingleton(
    () => UpdateUserSettings(getIt<SettingsRepository>()),
  );
  getIt.registerLazySingleton<UserSettingsCubit>(
    () => UserSettingsCubit(
      get: getIt<GetUserSettings>(),
      update: getIt<UpdateUserSettings>(),
    ),
  );

  // Tasks - Data
  getIt.registerLazySingleton<TaskRemoteDataSource>(
    () => TaskRemoteDataSourceImpl(dio: getIt<Dio>()),
  );
  getIt.registerLazySingleton<TaskRepository>(
    () => TaskRepositoryImpl(remoteDataSource: getIt<TaskRemoteDataSource>()),
  );

  // Tasks - Use Cases
  getIt.registerLazySingleton(() => GetTasks(getIt<TaskRepository>()));
  getIt.registerLazySingleton(() => CreateTask(getIt<TaskRepository>()));
  getIt.registerLazySingleton(() => UpdateTask(getIt<TaskRepository>()));
  getIt.registerLazySingleton(() => DeleteTask(getIt<TaskRepository>()));
  getIt.registerLazySingleton(() => GetTaskHistory(getIt<TaskRepository>()));
  getIt.registerLazySingleton(() => MoveTask(getIt<TaskRepository>()));

  // Subtasks
  getIt.registerLazySingleton<SubtaskRemoteDataSource>(
    () => SubtaskRemoteDataSourceImpl(dio: getIt<Dio>()),
  );
  getIt.registerLazySingleton<SubtaskRepository>(
    () => SubtaskRepositoryImpl(remoteDataSource: getIt<SubtaskRemoteDataSource>()),
  );
  getIt.registerLazySingleton(() => CreateSubtask(getIt<SubtaskRepository>()));
  getIt.registerLazySingleton(() => ToggleSubtask(getIt<SubtaskRepository>()));
  getIt.registerLazySingleton(() => DeleteSubtask(getIt<SubtaskRepository>()));

  // Attachments
  getIt.registerLazySingleton<AttachmentRemoteDataSource>(
    () => AttachmentRemoteDataSourceImpl(dio: getIt<Dio>()),
  );
  getIt.registerLazySingleton<AttachmentRepository>(
    () => AttachmentRepositoryImpl(
      remoteDataSource: getIt<AttachmentRemoteDataSource>(),
    ),
  );
  getIt.registerLazySingleton(() => UploadAttachment(getIt<AttachmentRepository>()));
  getIt.registerLazySingleton(() => DeleteAttachment(getIt<AttachmentRepository>()));

  // Projects - Data
  getIt.registerLazySingleton<ProjectRemoteDataSource>(
    () => ProjectRemoteDataSourceImpl(dio: getIt<Dio>()),
  );
  getIt.registerLazySingleton<ProjectRepository>(
    () => ProjectRepositoryImpl(remoteDataSource: getIt<ProjectRemoteDataSource>()),
  );

  // Projects - Use Cases
  getIt.registerLazySingleton(() => GetProjects(getIt<ProjectRepository>()));
  getIt.registerLazySingleton(() => GetProject(getIt<ProjectRepository>()));
  getIt.registerLazySingleton(() => CreateProject(getIt<ProjectRepository>()));
  getIt.registerLazySingleton(() => UpdateProject(getIt<ProjectRepository>()));
  getIt.registerLazySingleton(() => UpdateProjectStatus(getIt<ProjectRepository>()));
  getIt.registerLazySingleton(() => DeleteProject(getIt<ProjectRepository>()));
  getIt.registerLazySingleton(() => GetProjectColumns(getIt<ProjectRepository>()));
  getIt.registerLazySingleton(() => UploadProjectLogo(getIt<ProjectRepository>()));

  // Categories
  getIt.registerLazySingleton<CategoryRemoteDataSource>(
    () => CategoryRemoteDataSourceImpl(dio: getIt<Dio>()),
  );
  getIt.registerLazySingleton<CategoryRepository>(
    () => CategoryRepositoryImpl(
      remoteDataSource: getIt<CategoryRemoteDataSource>(),
    ),
  );
  getIt.registerLazySingleton(() => GetCategories(getIt<CategoryRepository>()));
  getIt.registerLazySingleton(() => CreateCategory(getIt<CategoryRepository>()));
  getIt.registerLazySingleton(() => UpdateCategory(getIt<CategoryRepository>()));
  getIt.registerLazySingleton(() => DeleteCategory(getIt<CategoryRepository>()));

  // Project sharing
  getIt.registerLazySingleton<ProjectShareRemoteDataSource>(
    () => ProjectShareRemoteDataSourceImpl(dio: getIt<Dio>()),
  );
  getIt.registerLazySingleton<ProjectShareRepository>(
    () => ProjectShareRepositoryImpl(
      remoteDataSource: getIt<ProjectShareRemoteDataSource>(),
    ),
  );
  getIt.registerLazySingleton(() => GetInviteCode(getIt<ProjectShareRepository>()));
  getIt.registerLazySingleton(() => RefreshInviteCode(getIt<ProjectShareRepository>()));
  getIt.registerLazySingleton(() => JoinProject(getIt<ProjectShareRepository>()));
  getIt.registerLazySingleton(() => GetMembers(getIt<ProjectShareRepository>()));
  getIt.registerLazySingleton(() => AcceptMember(getIt<ProjectShareRepository>()));
  getIt.registerLazySingleton(() => RejectMember(getIt<ProjectShareRepository>()));
  getIt.registerLazySingleton(() => RemoveMember(getIt<ProjectShareRepository>()));

  // Columns
  getIt.registerLazySingleton<ColumnRemoteDataSource>(
    () => ColumnRemoteDataSourceImpl(dio: getIt<Dio>()),
  );
  getIt.registerLazySingleton<ColumnRepository>(
    () => ColumnRepositoryImpl(remoteDataSource: getIt<ColumnRemoteDataSource>()),
  );
  getIt.registerLazySingleton(() => CreateColumn(getIt<ColumnRepository>()));
  getIt.registerLazySingleton(() => UpdateColumn(getIt<ColumnRepository>()));
  getIt.registerLazySingleton(() => DeleteColumn(getIt<ColumnRepository>()));
  getIt.registerLazySingleton(() => ReorderColumns(getIt<ColumnRepository>()));
}
