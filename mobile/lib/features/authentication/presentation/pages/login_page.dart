import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../../../../shared/widgets/app_snackbar.dart';
import '../../../../shared/widgets/app_text_field.dart';
import '../../../../shared/widgets/app_password_field.dart';
import '../../../../shared/widgets/app_primary_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          failure: (message) => AppSnackbar.error(context, message),
        );
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Login'), centerTitle: true),
        body: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Icon(
                      Icons.task_alt,
                      size: 80,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(height: 32),
                    Text(
                      'Gestão de Tarefas',
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 48),
                    AppTextField(
                      controller: _usernameController,
                      label: 'Usuário',
                      semanticLabel: 'Campo de usuário',
                      prefixIcon: const Icon(Icons.person),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      validator: (v) {
                        if (v == null || v.isEmpty) {
                          return 'Por favor, insira seu usuário';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    AppPasswordField(
                      controller: _passwordController,
                      onEditingComplete: _handleLogin,
                      validator: (v) {
                        if (v == null || v.isEmpty) {
                          return 'Por favor, insira sua senha';
                        }
                        if (v.length < 6) {
                          return 'A senha deve ter pelo menos 6 caracteres';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    AppPrimaryButton(
                      label: 'Entrar',
                      isLoading: state is AuthLoading,
                      semanticLabel: 'Botão entrar',
                      onPressed: _handleLogin,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
            AuthEvent.loginRequested(
              username: _usernameController.text.trim(),
              password: _passwordController.text,
            ),
          );
    }
  }
}
