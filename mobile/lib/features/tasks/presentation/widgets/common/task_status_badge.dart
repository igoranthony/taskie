import 'package:flutter/material.dart';
import '../../../domain/entities/task.dart';
import '../../../../../shared/widgets/app_chip.dart';

enum TaskStatusBadgeStyle { chip, compact }

class TaskStatusBadge extends StatelessWidget {
  final TaskStatus status;
  final TaskStatusBadgeStyle style;

  const TaskStatusBadge({
    super.key,
    required this.status,
    this.style = TaskStatusBadgeStyle.chip,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final config = _statusConfig(status, cs);

    if (style == TaskStatusBadgeStyle.chip) {
      return AppChip(
        label: config.label,
        color: config.color,
        leading: CircleAvatar(backgroundColor: config.color, radius: 6),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: config.color.withValues(alpha: 0.1),
        border: Border.all(color: config.color.withValues(alpha: 0.5)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        config.label,
        style: TextStyle(
          fontSize: 11,
          color: config.color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  static _StatusConfig _statusConfig(TaskStatus status, ColorScheme cs) {
    switch (status) {
      case TaskStatus.backlog:
        return _StatusConfig(color: cs.outline, label: 'Backlog');
      case TaskStatus.emAndamento:
        return _StatusConfig(color: cs.primary, label: 'Em Andamento');
      case TaskStatus.concluido:
        return _StatusConfig(color: cs.tertiary, label: 'Concluído');
    }
  }
}

class _StatusConfig {
  final Color color;
  final String label;
  _StatusConfig({required this.color, required this.label});
}
