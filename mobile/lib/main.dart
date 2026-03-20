import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/di/service_locator.dart';
import 'package:go_router/go_router.dart';
import 'core/router/app_router.dart';
import 'core/theme/material_theme.dart';
import 'features/authentication/domain/repositories/auth_repository.dart';
import 'features/authentication/domain/usecases/get_current_user.dart';
import 'features/authentication/domain/usecases/login.dart';
import 'features/authentication/domain/usecases/logout.dart';
import 'features/authentication/presentation/bloc/auth_bloc.dart';
import 'features/authentication/presentation/bloc/auth_event.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();

  final authBloc = AuthBloc(
    authRepository: getIt<AuthRepository>(),
    login: getIt<Login>(),
    logout: getIt<Logout>(),
    getCurrentUser: getIt<GetCurrentUser>(),
  )..add(const AuthEvent.checkRequested());

  runApp(GestaoTarefasApp(authBloc: authBloc));
}

class GestaoTarefasApp extends StatefulWidget {
  final AuthBloc authBloc;

  const GestaoTarefasApp({super.key, required this.authBloc});

  @override
  State<GestaoTarefasApp> createState() => _GestaoTarefasAppState();
}

class _GestaoTarefasAppState extends State<GestaoTarefasApp> {
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _router = createRouter(widget.authBloc);
  }

  @override
  void dispose() {
    _router.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = MaterialTheme(Theme.of(context).textTheme);
    return BlocProvider.value(
      value: widget.authBloc,
      child: MaterialApp.router(
        title: 'Gestão de Tarefas',
        debugShowCheckedModeBanner: false,
        theme: theme.light(),
        darkTheme: theme.dark(),
        routerConfig: _router,
      ),
    );
  }
}
