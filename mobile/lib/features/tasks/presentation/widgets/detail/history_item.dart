import 'package:flutter/material.dart';
import '../../../domain/entities/task_history.dart';
import '../../../../../shared/extensions/datetime_extensions.dart';

class HistoryItem extends StatelessWidget {
  final TaskHistory history;
  final bool isLast;

  const HistoryItem({
    super.key,
    required this.history,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ── Left: icon + connecting line ──────────────────────────
            SizedBox(
              width: 36,
              child: Column(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: cs.surfaceContainerHigh,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      _fieldIcon(history.fieldName),
                      size: 18,
                      color: cs.primary,
                    ),
                  ),
                  if (!isLast)
                    Expanded(
                      child: Center(
                        child: Container(width: 2, color: cs.outlineVariant),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            // ── Card ──────────────────────────────────────────────────
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: cs.surfaceContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                clipBehavior: Clip.antiAlias,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Left accent strip
                    Container(width: 3, color: cs.primary),
                    // Content
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // CAMPO ALTERADO • Field name
                            Row(
                              children: [
                                Text(
                                  'CAMPO ALTERADO',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w800,
                                    color: cs.primary,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                                Text(
                                  ' • ',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: cs.onSurfaceVariant,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    _fieldLabel(history.fieldName),
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: cs.onSurface,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            // Actor + Date
                            Row(
                              children: [
                                Icon(
                                  Icons.person_outline,
                                  size: 12,
                                  color: cs.onSurfaceVariant,
                                ),
                                const SizedBox(width: 4),
                                Flexible(
                                  child: Text(
                                    history.changedBy,
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: cs.onSurfaceVariant,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Icon(
                                  Icons.access_time,
                                  size: 12,
                                  color: cs.onSurfaceVariant,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  history.changedAt.toDateTimeBR(),
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: cs.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            // Detail box
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: cs.surfaceContainerHighest,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (history.oldValue != null) ...[
                                    Text(
                                      'VALOR ANTERIOR',
                                      style: TextStyle(
                                        fontSize: 9,
                                        fontWeight: FontWeight.w700,
                                        color: cs.onSurfaceVariant,
                                        letterSpacing: 0.8,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Container(
                                          width: 7,
                                          height: 7,
                                          decoration: BoxDecoration(
                                            color: cs.outlineVariant,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Flexible(
                                          child: Text(
                                            _formatValue(history.fieldName, history.oldValue!),
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontStyle: FontStyle.italic,
                                              color: cs.onSurfaceVariant,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                  ],
                                  if (history.newValue != null) ...[
                                    Text(
                                      'NOVO VALOR',
                                      style: TextStyle(
                                        fontSize: 9,
                                        fontWeight: FontWeight.w700,
                                        color: cs.primary,
                                        letterSpacing: 0.8,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Container(
                                          width: 7,
                                          height: 7,
                                          decoration: BoxDecoration(
                                            color: cs.primary,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Flexible(
                                          child: Text(
                                            _formatValue(history.fieldName, history.newValue!),
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                              color: cs.onSurface,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static IconData _fieldIcon(String field) {
    switch (field) {
      case 'status':
        return Icons.radio_button_checked_outlined;
      case 'prioridade':
        return Icons.flag_outlined;
      case 'titulo':
        return Icons.title;
      case 'descricao':
        return Icons.description_outlined;
      case 'atribuido_para':
        return Icons.person_outline;
      case 'data_limite':
        return Icons.event_outlined;
      default:
        return Icons.edit_outlined;
    }
  }

  static const _fieldLabels = {
    'titulo': 'Título',
    'descricao': 'Descrição',
    'status': 'Status',
    'prioridade': 'Prioridade',
    'atribuido_para': 'Atribuição',
    'data_limite': 'Data Limite',
  };

  String _fieldLabel(String field) => _fieldLabels[field] ?? field;

  static const _statusLabels = {
    'backlog': 'Backlog',
    'em_andamento': 'Em andamento',
    'concluido': 'Concluído',
  };

  static const _priorityLabels = {
    'baixa': 'Baixa',
    'media': 'Média',
    'alta': 'Alta',
  };

  String _formatValue(String field, String value) {
    switch (field) {
      case 'status':
        return _statusLabels[value] ?? value;
      case 'prioridade':
        return _priorityLabels[value] ?? value;
      case 'data_limite':
        try {
          return DateTime.parse(value).toLocal().toDateTimeBR();
        } catch (_) {
          return value;
        }
      default:
        return value;
    }
  }
}
