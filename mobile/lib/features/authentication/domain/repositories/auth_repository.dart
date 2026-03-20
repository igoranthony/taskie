import '../entities/user.dart';

abstract class AuthRepository {
  Future<User?> getCurrentUser();
  Future<void> login(String email, String password);
  Future<void> logout();
  Future<bool> isAuthenticated();
  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();
}