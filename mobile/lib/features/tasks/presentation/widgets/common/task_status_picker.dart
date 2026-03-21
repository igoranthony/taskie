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
        color: cs.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle
          const SizedBox(height: 12),
          Container(
            width: 36,
            height: 4,
            decoration: BoxDecoration(
              color: cs.outlineVariant,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),
          // Task info
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  'TRX-${task.id.substring(0, 8).toUpperCase()}',
                  style: tt.labelSmall?.copyWith(
                    color: cs.onSurfaceVariant,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(width: 8),
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
          ),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Alterar status',
                style: tt.titleMedium?.copyWith(
                  color: cs.onSurface,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Divider(height: 1, color: cs.outlineVariant),
          // Status options
          for (final status in TaskStatus.values)
            _StatusOption(
              status: status,
              isCurrent: status == task.status,
              onTap: () {
                Navigator.pop(context);
                if (status != task.status) onStatusChange(status);
              },
            ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class _StatusOption extends StatelessWidget {
  final TaskStatus status;
  final bool isCurrent;
  final VoidCallback onTap;

  const _StatusOption({
    required this.status,
    required this.isCurrent,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final s = cs.statusColor(status);
    final (label, color) = (s.label, s.fg);

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: isCurrent ? FontWeight.w700 : FontWeight.w400,
                  color: isCurrent ? cs.onSurface : cs.onSurfaceVariant,
                ),
              ),
            ),
            if (isCurrent)
              Icon(Icons.check_rounded, size: 18, color: cs.primary),
          ],
        ),
      ),
    );
  }
}
