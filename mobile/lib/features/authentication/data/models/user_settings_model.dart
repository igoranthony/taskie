import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user_settings.dart';

part 'user_settings_model.freezed.dart';
part 'user_settings_model.g.dart';

@freezed
abstract class UserSettingsModel with _$UserSettingsModel {
  const UserSettingsModel._();

  const factory UserSettingsModel({
    required String tema,
    @JsonKey(name: 'cor_accent') required String corAccent,
  }) = _UserSettingsModel;

  factory UserSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$UserSettingsModelFromJson(json);

  UserSettings toEntity() => UserSettings(
        tema: tema == 'light' ? AppThemeMode.light : AppThemeMode.dark,
        corAccent: corAccent,
      );

  static String themeToString(AppThemeMode mode) =>
      mode == AppThemeMode.light ? 'light' : 'dark';
}
