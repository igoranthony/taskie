import '../../domain/entities/user_settings.dart';
import '../../domain/repositories/settings_repository.dart';
import '../datasources/settings_remote_datasource.dart';
import '../models/user_settings_model.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsRemoteDataSource remoteDataSource;

  SettingsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<UserSettings> get() async {
    final model = await remoteDataSource.get();
    return model.toEntity();
  }

  @override
  Future<UserSettings> update({AppThemeMode? tema, String? corAccent}) async {
    final model = await remoteDataSource.update(
      tema: tema != null ? UserSettingsModel.themeToString(tema) : null,
      corAccent: corAccent,
    );
    return model.toEntity();
  }
}
