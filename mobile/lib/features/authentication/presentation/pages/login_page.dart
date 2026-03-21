import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
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
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          failure: (message) => AppSnackbar.error(context, message),
          sessionExpired: () => AppSnackbar.warning(
            context,
            'Sua sessão expirou. Faça login novamente.',
          ),
        );
      },
      child: Scaffold(
        backgroundColor: cs.surface,
        body: SafeArea(
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top -
                        MediaQuery.of(context).padding.bottom,
                  ),
                  child: IntrinsicHeight(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Spacer(),

                          // ── Brand ───────────────────────────────────
                          Center(
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/logo.png',
                                  width: 90,
                                  height: 90,
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  'TRADEX',
                                  style: GoogleFonts.spaceGrotesk(
                                    fontSize: tt.headlineLarge?.fontSize,
                                    fontWeight: FontWeight.w900,
                                    color: cs.onSurface,
                                    letterSpacing: 3,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  'Gestão de Tarefas',
                                  style: tt.bodyMedium?.copyWith(
                                    color: cs.onSurfaceVariant,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 48),

                          // ── Form ────────────────────────────────────
                          Text(
                            'Entrar',
                            style: tt.titleLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: cs.onSurface,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Acesse sua conta para continuar',
                            style: tt.bodySmall?.copyWith(
                              color: cs.onSurfaceVariant,
                            ),
                          ),
                          const SizedBox(height: 24),
                          AppTextField(
                            controller: _usernameController,
                            label: 'Usuário',
                            semanticLabel: 'Campo de usuário',
                            prefixIcon: const Icon(Icons.person_outline_rounded),
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            validator: (v) => (v == null || v.isEmpty)
                                ? 'Por favor, insira seu usuário'
                                : null,
                          ),
                          const SizedBox(height: 12),
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

                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
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
