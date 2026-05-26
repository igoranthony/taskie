import 'package:flutter/material.dart';
import '../../../domain/entities/task.dart';
import '../../../../../core/theme/material_theme.dart';

class TaskStatusPicker {
  TaskStatusPicker._();

  static void show(
    BuildContext context, {
    required Task task,
    required ValueChanged<TaskStatus> onStatusChange,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => _TaskStatusPickerSheet(
        task: task,
        onStatusChange: onStatusChange,
      ),
    );
  }
}

class _TaskStatusPickerSheet extends StatelessWidget {
  final Task task;
  final ValueChanged<TaskStatus> onStatusChange;

  const _TaskStatusPickerSheet({
    required this.task,
    required this.onStatusChange,
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
                  'Alterar status',
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
              children: TaskStatus.values.map((status) {
                final isDisabled = task.status == TaskStatus.concluido &&
                    status != TaskStatus.concluido;
                return _StatusOption(
                  status: status,
                  isCurrent: status == task.status,
                  isDisabled: isDisabled,
                  onTap: () {
                    Navigator.pop(context);
                    if (status != task.status) onStatusChange(status);
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

class _StatusOption extends StatelessWidget {
  final TaskStatus status;
  final bool isCurrent;
  final bool isDisabled;
  final VoidCallback onTap;

  const _StatusOption({
    required this.status,
    required this.isCurrent,
    required this.onTap,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final s = cs.statusColor(status);

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        decoration: BoxDecoration(
          color: isCurrent ? s.bg : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isCurrent ? s.fg.withAlpha(80) : cs.outlineVariant.withAlpha(isDisabled ? 40 : 120),
            width: 1,
          ),
        ),
        child: InkWell(
          onTap: isDisabled ? null : onTap,
          borderRadius: BorderRadius.circular(14),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                // Status color indicator
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: s.bg,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: s.fg.withAlpha(isDisabled ? 40 : 80),
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: isDisabled ? s.fg.withAlpha(60) : s.fg,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    s.label,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: isCurrent ? FontWeight.w700 : FontWeight.w500,
                      color: isDisabled
                          ? cs.onSurfaceVariant.withAlpha(80)
                          : isCurrent
                              ? s.fg
                              : cs.onSurface,
                    ),
                  ),
                ),
                if (isCurrent)
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: s.fg.withAlpha(20),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.check_rounded,
                      size: 16,
                      color: s.fg,
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
