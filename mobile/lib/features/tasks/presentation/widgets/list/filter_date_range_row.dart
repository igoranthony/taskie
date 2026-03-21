import 'package:flutter/material.dart';
import '../../../../../shared/widgets/app_date_picker_field.dart';

class FilterDateRangeRow extends StatelessWidget {
  final String label;
  final DateTime? start;
  final DateTime? end;
  final ValueChanged<DateTime?> onStartChanged;
  final ValueChanged<DateTime?> onEndChanged;
  final DateTime firstDate;
  final DateTime lastDate;

  const FilterDateRangeRow({
    super.key,
    required this.label,
    required this.start,
    required this.end,
    required this.onStartChanged,
    required this.onEndChanged,
    required this.firstDate,
    required this.lastDate,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: AppDatePickerField(
            label: label,
            hint: 'Início',
            value: start,
            firstDate: firstDate,
            lastDate: end ?? lastDate,
            onChanged: onStartChanged,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: AppDatePickerField(
            label: '',
            hint: 'Fim',
            value: end,
            firstDate: start ?? firstDate,
            lastDate: lastDate,
            onChanged: onEndChanged,
          ),
        ),
      ],
    );
  }
}
