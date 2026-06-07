import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskie/core/errors/app_error_parser.dart';
import '../../domain/entities/user_settings.dart';
import '../../domain/usecases/settings_use_cases.dart';

/// Estado: settings atuais ou null enquanto não carrega.
/// Quando não logado/carregando, devolve defaults para o tema renderizar.
class UserSettingsCubit extends Cubit<UserSettings> {
  final GetUserSettings _get;
  final UpdateUserSettings _update;

  /// Default usado antes de carregar do backend ou quando offline.
  static const defaults = UserSettings(
    tema: AppThemeMode.dark,
    corAccent: '#10b981',
  );

  UserSettingsCubit({
    required GetUserSettings get,
    required UpdateUserSettings update,
  })  : _get = get,
        _update = update,
        super(defaults);

  Future<void> load() async {
    try {
      emit(await _get());
    } catch (_) {
      // Silencioso: mantém defaults se falhar.
    }
  }

  /// Reseta para defaults (usado após logout).
  void reset() => emit(defaults);

  Future<String?> update({AppThemeMode? tema, String? corAccent}) async {
    final prev = state;
    // otimismo: aplica local antes de confirmar com backend
    emit(prev.copyWith(tema: tema, corAccent: corAccent));
    try {
      final updated = await _update(tema: tema, corAccent: corAccent);
      emit(updated);
      return null;
    } catch (e) {
      emit(prev);
      return AppErrorParser.parse(e);
    }
  }
}
