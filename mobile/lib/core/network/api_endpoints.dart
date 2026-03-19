class ApiEndpoints {
  static const String baseUrl = 'http://192.168.1.3:8000/api';
  
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
}