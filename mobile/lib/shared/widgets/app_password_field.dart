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
    return Semantics(
      label: widget.label,
      child: TextFormField(
        controller: widget.controller,
        obscureText: !_visible,
        textInputAction: widget.textInputAction,
        onEditingComplete: widget.onEditingComplete,
        decoration: InputDecoration(
          labelText: widget.label,
          prefixIcon: const Icon(Icons.lock),
          border: const OutlineInputBorder(),
          suffixIcon: IconButton(
            icon: Icon(_visible ? Icons.visibility : Icons.visibility_off),
            tooltip: _visible ? 'Ocultar senha' : 'Mostrar senha',
            onPressed: () => setState(() => _visible = !_visible),
          ),
        ),
        validator: widget.validator,
      ),
    );
  }
}
