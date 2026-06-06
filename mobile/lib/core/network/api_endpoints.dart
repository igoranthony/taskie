import '../config/app_env.dart';

class ApiEndpoints {
  static String get baseUrl => AppEnv.baseUrl;

  // Authentication endpoints
  static const String login = '/auth/login/';
  static const String refresh = '/auth/refresh/';
  static const String logout = '/auth/logout/';
  static const String user = '/auth/me/';
  static const String users = '/auth/users/';

  // Tasks endpoints
  static const String tasks = '/tasks/';
  static String taskDetail(String id) => '/tasks/$id/';
  static String taskHistory(String id) => '/tasks/$id/history/';

  // Projects endpoints
  static const String projects = '/projects/';
  static String projectDetail(String id) => '/projects/$id/';
  static String projectStatus(String id) => '/projects/$id/status/';
}
