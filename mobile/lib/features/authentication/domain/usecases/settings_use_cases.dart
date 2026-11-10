import '../entities/user_settings.dart';
import '../repositories/settings_repository.dart';

class GetUserSettings {
  final SettingsRepository repository;
  GetUserSettings(this.repository);
  Future<UserSettings> call() => repository.get();
}

class UpdateUserSettings {
  final SettingsRepository repository;
  UpdateUserSettings(this.repository);
  Future<UserSettings> call({AppThemeMode? tema, String? corAccent}) =>
      repository.update(tema: tema, corAccent: corAccent);
}
