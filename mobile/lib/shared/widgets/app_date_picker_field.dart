import 'package:flutter/material.dart';
import '../extensions/datetime_extensions.dart';

class AppDatePickerField extends StatelessWidget {
  final String label;
  final String hint;
  final DateTime? value;
  final ValueChanged<DateTime?> onChanged;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final bool clearable;

  const AppDatePickerField({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.hint = 'Selecionar',
    this.firstDate,
    this.lastDate,
    this.clearable = true,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final radius = BorderRadius.circular(12);
    final hasValue = value != null;

    return Semantics(
      label: '$label — ${hasValue ? value!.toDateBR() : 'não definida'}',
      button: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label.isNotEmpty) ...[
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: cs.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 4),
          ],
          InkWell(
            onTap: () => _pickDate(context),
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
                        icon: Icon(
                          Icons.close_rounded,
                          size: 18,
                          color: cs.onSurfaceVariant,
                        ),
                        onPressed: () => onChanged(null),
                        tooltip: 'Remover data',
                      )
                    : Icon(
                        Icons.calendar_today_rounded,
                        size: 18,
                        color: cs.onSurfaceVariant,
                      ),
              ),
              child: Text(
                hasValue ? value!.toDateBR() : hint,
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

  Future<void> _pickDate(BuildContext context) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: value ?? now.add(const Duration(days: 7)),
      firstDate: firstDate ?? now,
      lastDate: lastDate ?? now.add(const Duration(days: 365)),
    );
    if (picked != null) onChanged(picked);
  }
}
