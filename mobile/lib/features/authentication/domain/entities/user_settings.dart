import 'package:equatable/equatable.dart';

enum AppThemeMode { dark, light }

class UserSettings extends Equatable {
  final AppThemeMode tema;
  final String corAccent;

  const UserSettings({
    required this.tema,
    required this.corAccent,
  });

  UserSettings copyWith({AppThemeMode? tema, String? corAccent}) =>
      UserSettings(
        tema: tema ?? this.tema,
        corAccent: corAccent ?? this.corAccent,
      );

  @override
  List<Object?> get props => [tema, corAccent];
}
