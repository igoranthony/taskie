import 'package:flutter/material.dart';
import '../extensions/datetime_extensions.dart';

class AppDatePickerField extends StatelessWidget {
  final String label;
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
    this.firstDate,
    this.lastDate,
    this.clearable = true,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Semantics(
          label: '$label — ${value != null ? value!.toDateBR() : 'não definida'}',
          button: true,
          child: InkWell(
            onTap: () => _pickDate(context),
            borderRadius: BorderRadius.circular(4),
            child: InputDecorator(
              decoration: InputDecoration(
                labelText: label,
                border: const OutlineInputBorder(),
                suffixIcon: const Icon(Icons.calendar_today),
              ),
              child: Text(
                value != null ? value!.toDateBR() : 'Selecionar data',
                style: TextStyle(
                  color: value != null ? null : cs.onSurfaceVariant,
                ),
              ),
            ),
          ),
        ),
        if (clearable && value != null) ...[
          const SizedBox(height: 4),
          TextButton.icon(
            onPressed: () => onChanged(null),
            icon: const Icon(Icons.close, size: 16),
            label: const Text('Remover data'),
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ],
      ],
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
