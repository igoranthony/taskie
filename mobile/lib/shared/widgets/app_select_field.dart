import 'package:flutter/material.dart';

class AppSelectField<T> extends StatelessWidget {
  final String label;
  final T value;
  final List<AppSelectOption<T>> options;
  final ValueChanged<T?> onChanged;
  final String? Function(T?)? validator;

  const AppSelectField({
    super.key,
    required this.label,
    required this.value,
    required this.options,
    required this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      initialValue: value,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      items: options
          .map((o) => DropdownMenuItem<T>(value: o.value, child: Text(o.label)))
          .toList(),
      onChanged: onChanged,
      validator: validator,
    );
  }
}

class AppSelectOption<T> {
  final T value;
  final String label;

  const AppSelectOption({required this.value, required this.label});
}
