import 'package:flutter/material.dart';

class AppSelectField<T> extends StatelessWidget {
  final String label;
  final T value;
  final List<AppSelectOption<T>> options;
  final ValueChanged<T?> onChanged;
  final String? Function(T?)? validator;
  final bool loading;

  const AppSelectField({
    super.key,
    required this.label,
    required this.value,
    required this.options,
    required this.onChanged,
    this.validator,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final radius = BorderRadius.circular(12);

    final decoration = InputDecoration(
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
      disabledBorder: OutlineInputBorder(
        borderRadius: radius,
        borderSide:
            BorderSide(color: cs.outlineVariant.withAlpha(100), width: 1),
      ),
      suffixIcon: loading
          ? Padding(
              padding: const EdgeInsets.all(14),
              child: SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: cs.onSurfaceVariant,
                ),
              ),
            )
          : null,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: cs.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 4),
        if (loading)
          InputDecorator(
            decoration: decoration,
            child: Text(
              '...',
              style: TextStyle(color: cs.onSurfaceVariant),
            ),
          )
        else
          DropdownButtonFormField<T>(
            initialValue: value,
            decoration: decoration,
            dropdownColor: cs.surfaceContainerHigh,
            borderRadius: BorderRadius.circular(12),
            items: options
                .map((o) =>
                    DropdownMenuItem<T>(value: o.value, child: Text(o.label)))
                .toList(),
            onChanged: onChanged,
            validator: validator,
          ),
      ],
    );
  }
}

class AppSelectOption<T> {
  final T value;
  final String label;

  const AppSelectOption({required this.value, required this.label});
}
