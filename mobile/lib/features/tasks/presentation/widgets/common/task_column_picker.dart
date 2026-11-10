import 'package:flutter/material.dart';
import '../../../../projects/domain/entities/project_column.dart';
import '../../../domain/entities/task.dart';

class TaskColumnPicker {
  TaskColumnPicker._();

  static void show(
    BuildContext context, {
    required Task task,
    required List<ProjectColumn> columns,
    required ValueChanged<ProjectColumn> onColumnChange,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => _TaskColumnPickerSheet(
        task: task,
        columns: columns,
        onColumnChange: onColumnChange,
      ),
    );
  }
}

class _TaskColumnPickerSheet extends StatelessWidget {
  final Task task;
  final List<ProjectColumn> columns;
  final ValueChanged<ProjectColumn> onColumnChange;

  const _TaskColumnPickerSheet({
    required this.task,
    required this.columns,
    required this.onColumnChange,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.fromLTRB(12, 0, 12, 24),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          // Handle
          Container(
            width: 36,
            height: 4,
            decoration: BoxDecoration(
              color: cs.outlineVariant,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 20),
          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: cs.surfaceContainer,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        'TRX-${task.id.substring(0, 8).toUpperCase()}',
                        style: tt.labelSmall?.copyWith(
                          color: cs.onSurfaceVariant,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        task.titulo,
                        style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  'Mover para coluna',
                  style: tt.titleMedium?.copyWith(
                    color: cs.onSurface,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Options
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Column(
              children: columns.map((c) {
                final isCurrent = c.id == task.colunaId;
                return _ColumnOption(
                  column: c,
                  isCurrent: isCurrent,
                  onTap: () {
                    Navigator.pop(context);
                    if (!isCurrent) onColumnChange(c);
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _ColumnOption extends StatelessWidget {
  final ProjectColumn column;
  final bool isCurrent;
  final VoidCallback onTap;

  const _ColumnOption({
    required this.column,
    required this.isCurrent,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    // Cor de fundo / acento. Coluna de "done" usa primary, outras secondary.
    final accent = column.isDoneColumn ? cs.primary : cs.secondary;
    final bg = column.isDoneColumn ? cs.primaryContainer : cs.secondaryContainer;
    final fg = column.isDoneColumn ? cs.onPrimaryContainer : cs.onSecondaryContainer;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        decoration: BoxDecoration(
          color: isCurrent ? bg : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isCurrent ? accent.withAlpha(80) : cs.outlineVariant.withAlpha(120),
            width: 1,
          ),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(14),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: bg,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: accent.withAlpha(80),
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      column.isDoneColumn
                          ? Icons.check_rounded
                          : Icons.view_column_outlined,
                      size: 18,
                      color: fg,
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    column.nome,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: isCurrent ? FontWeight.w700 : FontWeight.w500,
                      color: isCurrent ? fg : cs.onSurface,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (isCurrent)
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: accent.withAlpha(20),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.check_rounded,
                      size: 16,
                      color: fg,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
