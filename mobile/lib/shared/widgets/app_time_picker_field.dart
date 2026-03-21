import 'package:flutter/material.dart';

class AppTimePickerField extends StatelessWidget {
  final String label;
  final TimeOfDay? value;
  final ValueChanged<TimeOfDay?> onChanged;
  final bool clearable;

  const AppTimePickerField({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.clearable = true,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final radius = BorderRadius.circular(12);
    final hasValue = value != null;
    final display = hasValue ? _format(value!) : 'Selecionar';

    return Semantics(
      label: '$label — $display',
      button: true,
      child: Column(
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
          InkWell(
            onTap: () => _pickTime(context),
            borderRadius: radius,
            child: InputDecorator(
              decoration: InputDecoration(
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
                suffixIcon: hasValue && clearable
                    ? IconButton(
                        icon: Icon(Icons.close_rounded,
                            size: 18, color: cs.onSurfaceVariant),
                        onPressed: () => onChanged(null),
                        tooltip: 'Remover horário',
                      )
                    : Icon(Icons.access_time_rounded,
                        size: 18, color: cs.onSurfaceVariant),
              ),
              child: Text(
                display,
                style: TextStyle(
                  color: hasValue ? cs.onSurface : cs.onSurfaceVariant,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _pickTime(BuildContext context) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: value ?? TimeOfDay.now(),
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
        child: child!,
      ),
    );
    if (picked != null) onChanged(picked);
  }

  static String _format(TimeOfDay t) {
    final h = t.hour.toString().padLeft(2, '0');
    final m = t.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }
}
