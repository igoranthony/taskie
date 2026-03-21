import 'package:flutter/material.dart';

class AppPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;
  final TextInputAction textInputAction;
  final VoidCallback? onEditingComplete;

  const AppPasswordField({
    super.key,
    required this.controller,
    this.label = 'Senha',
    this.validator,
    this.textInputAction = TextInputAction.done,
    this.onEditingComplete,
  });

  @override
  State<AppPasswordField> createState() => _AppPasswordFieldState();
}

class _AppPasswordFieldState extends State<AppPasswordField> {
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final radius = BorderRadius.circular(12);

    return Semantics(
      label: widget.label,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: cs.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 4),
          TextFormField(
            controller: widget.controller,
            obscureText: !_visible,
            textInputAction: widget.textInputAction,
            onEditingComplete: widget.onEditingComplete,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock_outline_rounded),
              filled: true,
              fillColor: cs.surfaceContainer,
              contentPadding: const EdgeInsets.symmetric(horizontal: 14),
              border: OutlineInputBorder(
                borderRadius: radius,
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: radius,
                borderSide: BorderSide(color: cs.outlineVariant, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: radius,
                borderSide: BorderSide(color: cs.primary, width: 1.5),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: radius,
                borderSide: BorderSide(color: cs.error, width: 1),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: radius,
                borderSide: BorderSide(color: cs.error, width: 1.5),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _visible
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  size: 20,
                  color: cs.onSurfaceVariant,
                ),
                tooltip: _visible ? 'Ocultar senha' : 'Mostrar senha',
                onPressed: () => setState(() => _visible = !_visible),
              ),
            ),
            validator: widget.validator,
          ),
        ],
      ),
    );
  }
}
