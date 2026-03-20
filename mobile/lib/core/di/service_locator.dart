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
import '../../features/authentication/presentation/cubit/users_cubit.dart';
import '../../features/tasks/data/datasources/task_remote_datasource.dart';
import '../../features/tasks/data/repositories/task_repository_impl.dart';
import '../../features/tasks/domain/repositories/task_repository.dart';
import '../../features/tasks/domain/usecases/get_tasks.dart';
import '../../features/tasks/domain/usecases/create_task.dart';
import '../../features/tasks/domain/usecases/update_task.dart';
import '../../features/tasks/domain/usecases/delete_task.dart';
import '../../features/tasks/domain/usecases/get_task_history.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Core
  getIt.registerLazySingleton<SecureStorage>(() => SecureStorage());
  getIt.registerLazySingleton<ApiClient>(
    () => ApiClient(storage: getIt<SecureStorage>()),
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

  // Users Cubit (factory = nova instância por página)
  getIt.registerFactory(() => UsersCubit(getIt<Dio>()));

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
}
