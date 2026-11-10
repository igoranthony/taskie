import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/di/service_locator.dart';
import 'package:go_router/go_router.dart';
import 'core/router/app_router.dart';
import 'core/theme/material_theme.dart';
import 'features/authentication/domain/entities/user_settings.dart';
import 'features/authentication/presentation/bloc/auth_bloc.dart';
import 'features/authentication/presentation/bloc/auth_event.dart';
import 'features/authentication/presentation/bloc/auth_state.dart';
import 'features/authentication/presentation/cubit/user_settings_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await setupServiceLocator();

  final authBloc = getIt<AuthBloc>()..add(const AuthEvent.checkRequested());

  runApp(TaskieApp(authBloc: authBloc));
}

class TaskieApp extends StatefulWidget {
  final AuthBloc authBloc;

  const TaskieApp({super.key, required this.authBloc});

  @override
  State<TaskieApp> createState() => _TaskieAppState();
}

class _TaskieAppState extends State<TaskieApp> {
  late final GoRouter _router;
  late final UserSettingsCubit _settingsCubit;
  late final StreamSubscription _authSub;

  @override
  void initState() {
    super.initState();
    _router = createRouter(widget.authBloc);
    _settingsCubit = getIt<UserSettingsCubit>();
    // Carrega settings quando autentica; reseta para defaults ao deslogar.
    _authSub = widget.authBloc.stream.listen((state) {
      if (state is AuthAuthenticated) {
        _settingsCubit.load();
      } else if (state is AuthUnauthenticated ||
          state is AuthStateSessionExpired) {
        _settingsCubit.reset();
      }
    });
    if (widget.authBloc.state is AuthAuthenticated) {
      _settingsCubit.load();
    }
  }

  @override
  void dispose() {
    _authSub.cancel();
    _router.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: widget.authBloc),
        BlocProvider.value(value: _settingsCubit),
      ],
      child: BlocBuilder<UserSettingsCubit, UserSettings>(
        builder: (context, settings) {
          final theme = MaterialTheme(
            GoogleFonts.interTextTheme(Theme.of(context).textTheme),
          );
          final accent = _parseHex(settings.corAccent);
          return MaterialApp.router(
            title: 'Taskie',
            debugShowCheckedModeBanner: false,
            theme: theme.light(accent: accent),
            darkTheme: theme.dark(accent: accent),
            themeMode: settings.tema == AppThemeMode.light
                ? ThemeMode.light
                : ThemeMode.dark,
            routerConfig: _router,
          );
        },
      ),
    );
  }

  Color? _parseHex(String hex) {
    final clean = hex.replaceAll('#', '').trim();
    if (clean.length != 6) return null;
    final value = int.tryParse('FF$clean', radix: 16);
    return value == null ? null : Color(value);
  }
}
