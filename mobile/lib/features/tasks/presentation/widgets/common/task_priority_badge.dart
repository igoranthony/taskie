import 'package:flutter/material.dart';
import '../../../domain/entities/task.dart';
import '../../../../../shared/widgets/app_chip.dart';

enum TaskPriorityBadgeStyle { chip, icon }

class TaskPriorityBadge extends StatelessWidget {
  final TaskPriority prioridade;
  final TaskPriorityBadgeStyle style;

  final double iconSize;

  const TaskPriorityBadge({
    super.key,
    required this.prioridade,
    this.style = TaskPriorityBadgeStyle.icon,
    this.iconSize = 22,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final config = _priorityConfig(prioridade, cs);

    if (style == TaskPriorityBadgeStyle.chip) {
      return AppChip(
        label: config.label,
        color: config.color,
        leading: Icon(config.icon, color: config.color, size: 18),
      );
    }

    return Semantics(
      label: 'Prioridade ${config.label}',
      child: Icon(config.icon, color: config.color, size: iconSize),
    );
  }

  static _PriorityConfig _priorityConfig(TaskPriority priority, ColorScheme cs) {
    switch (priority) {
      case TaskPriority.baixa:
        return _PriorityConfig(
          color: cs.tertiary,
          icon: Icons.south_rounded,
          label: 'Baixa',
        );
      case TaskPriority.media:
        return _PriorityConfig(
          color: cs.secondary,
          icon: Icons.east_rounded,
          label: 'Média',
        );
      case TaskPriority.alta:
        return _PriorityConfig(
          color: cs.error,
          icon: Icons.north_rounded,
          label: 'Alta',
        );
    }
  }
}

class _PriorityConfig {
  final Color color;
  final IconData icon;
  final String label;
  _PriorityConfig({
    required this.color,
    required this.icon,
    required this.label,
  });
}
