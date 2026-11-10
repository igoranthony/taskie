import '../entities/user_settings.dart';

abstract class SettingsRepository {
  Future<UserSettings> get();
  Future<UserSettings> update({AppThemeMode? tema, String? corAccent});
}
