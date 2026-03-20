import 'package:flutter/material.dart';
import '../../domain/entities/task_history.dart';
import '../../../../shared/extensions/datetime_extensions.dart';

class HistoryItem extends StatelessWidget {
  final TaskHistory history;

  const HistoryItem({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: cs.primary,
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                width: 2,
                height: 48,
                color: cs.outlineVariant,
              ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      _formatFieldName(history.fieldName),
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    Text(
                      _formatDate(history.changedAt),
                      style: TextStyle(fontSize: 11, color: cs.outline),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                _ValueChange(
                  oldValue: history.oldValue,
                  newValue: history.newValue,
                ),
                const SizedBox(height: 4),
                Text(
                  'por ${history.changedBy}',
                  style: TextStyle(fontSize: 12, color: cs.onSurfaceVariant),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatFieldName(String field) {
    const fieldNames = {
      'titulo': 'Título',
      'descricao': 'Descrição',
      'status': 'Status',
      'prioridade': 'Prioridade',
      'atribuido_para': 'Atribuído para',
      'data_limite': 'Data limite',
    };
    return fieldNames[field] ?? field;
  }

  String _formatDate(DateTime date) => date.toDateTimeBR();
}

class _ValueChange extends StatelessWidget {
  final String? oldValue;
  final String? newValue;

  const _ValueChange({this.oldValue, this.newValue});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Row(
      children: [
        if (oldValue != null) ...[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: cs.errorContainer,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: cs.error.withValues(alpha: 0.3)),
            ),
            child: Text(
              oldValue!,
              style: TextStyle(fontSize: 12, color: cs.onErrorContainer),
            ),
          ),
          const SizedBox(width: 6),
          Icon(Icons.arrow_forward, size: 12, color: cs.outline),
          const SizedBox(width: 6),
        ],
        if (newValue != null)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: cs.tertiaryContainer,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: cs.tertiary.withValues(alpha: 0.3)),
            ),
            child: Text(
              newValue!,
              style: TextStyle(fontSize: 12, color: cs.onTertiaryContainer),
            ),
          ),
      ],
    );
  }
}
