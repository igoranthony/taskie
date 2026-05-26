import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/di/service_locator.dart';
import 'package:go_router/go_router.dart';
import 'core/router/app_router.dart';
import 'core/theme/material_theme.dart';
import 'features/authentication/presentation/bloc/auth_bloc.dart';
import 'features/authentication/presentation/bloc/auth_event.dart';

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
    final theme = MaterialTheme(GoogleFonts.interTextTheme(Theme.of(context).textTheme));
    return BlocProvider.value(
      value: widget.authBloc,
      child: MaterialApp.router(
        title: 'Taskie',
        debugShowCheckedModeBanner: false,
        theme: theme.light(),
        darkTheme: theme.dark(),
        routerConfig: _router,
      ),
    );
  }
}
