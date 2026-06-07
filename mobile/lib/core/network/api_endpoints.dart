import '../config/app_env.dart';

class ApiEndpoints {
  static String get baseUrl => AppEnv.baseUrl;

  // Authentication endpoints
  static const String login = '/auth/login/';
  static const String refresh = '/auth/refresh/';
  static const String logout = '/auth/logout/';
  static const String user = '/auth/me/';
  static const String users = '/auth/users/';
  static const String userSettings = '/auth/settings/';

  // Tasks endpoints
  static const String tasks = '/tasks/';
  static String taskDetail(String id) => '/tasks/$id/';
  static String taskHistory(String id) => '/tasks/$id/history/';
  static String taskMove(String id) => '/tasks/$id/move/';

  // Projects endpoints
  static const String projects = '/projects/';
  static String projectDetail(String id) => '/projects/$id/';
  static String projectStatus(String id) => '/projects/$id/status/';
  static String projectBoard(String id) => '/projects/$id/board/';
  static String projectColumnsReorder(String id) =>
      '/projects/$id/columns/reorder/';
  static String projectLogo(String id) => '/projects/$id/logo/';
  static String projectInviteCode(String id) => '/projects/$id/invite-code/';
  static String projectInviteCodeRefresh(String id) =>
      '/projects/$id/invite-code/refresh/';
  static const String projectJoin = '/projects/join/';
  static String projectMembers(String id) => '/projects/$id/members/';
  static String projectAcceptMember(String id) =>
      '/projects/$id/accept-member/';
  static String projectRejectMember(String id) =>
      '/projects/$id/reject-member/';
  static String projectRemoveMember(String id) =>
      '/projects/$id/remove-member/';

  // Categories endpoints
  static const String categories = '/categories/';
  static String categoryDetail(String id) => '/categories/$id/';

  // Columns endpoints
  static const String columns = '/columns/';
  static String columnDetail(String id) => '/columns/$id/';

  // Subtasks endpoints
  static const String subtasks = '/subtasks/';
  static String subtaskDetail(String id) => '/subtasks/$id/';
  static String subtaskToggle(String id) => '/subtasks/$id/toggle/';

  // Attachments endpoints
  static const String attachments = '/attachments/';
  static String attachmentDetail(String id) => '/attachments/$id/';
}
