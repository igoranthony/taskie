import 'dart:async';
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
  late final Timer _cursorTimer;
  bool _showCursor = true;

  @override
  void initState() {
    super.initState();
    _cursorTimer = Timer.periodic(const Duration(milliseconds: 530), (_) {
      setState(() => _showCursor = !_showCursor);
    });
  }

  @override
  void dispose() {
    _cursorTimer.cancel();
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
        body: CustomPaint(
          painter: _PixelGridPainter(color: cs.outlineVariant.withValues(alpha: 0.35)),
          child: SafeArea(
            child: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
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
                                    width: 120,
                                    height: 120,
                                    filterQuality: FilterQuality.none,
                                  ),
                                  const SizedBox(height: 28),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'TASKIE',
                                          style: GoogleFonts.pressStart2p(
                                            fontSize: 20,
                                            color: cs.primary,
                                            height: 1.4,
                                          ),
                                        ),
                                        TextSpan(
                                          text: _showCursor ? '_' : ' ',
                                          style: GoogleFonts.pressStart2p(
                                            fontSize: 20,
                                            color: cs.primary,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 14),
                                  Text(
                                    '// gestão de tarefas',
                                    style: GoogleFonts.sourceCodePro(
                                      fontSize: 12,
                                      color: cs.onSurfaceVariant,
                                      letterSpacing: 0.3,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 52),

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
                );
              },
            ),
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

class _PixelGridPainter extends CustomPainter {
  final Color color;

  const _PixelGridPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    const spacing = 22.0;
    const dotSize = 1.5;
    for (double x = spacing; x < size.width; x += spacing) {
      for (double y = spacing; y < size.height; y += spacing) {
        canvas.drawRect(
          Rect.fromCenter(center: Offset(x, y), width: dotSize, height: dotSize),
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(_PixelGridPainter old) => old.color != color;
}
