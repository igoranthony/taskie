import 'package:flutter/material.dart';
import '../../../domain/entities/task.dart';
import '../../../../../core/theme/material_theme.dart';

// ── Status selector ────────────────────────────────────────────────────────────

class TaskStatusSelector extends StatelessWidget {
  final TaskStatus value;
  final ValueChanged<TaskStatus> onChanged;

  const TaskStatusSelector({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: TaskStatus.values.map((status) {
        final isSelected = status == value;
        final s = Theme.of(context).colorScheme.statusColor(status);
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              right: status != TaskStatus.values.last ? 8 : 0,
            ),
            child: GestureDetector(
              onTap: () => onChanged(status),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: isSelected
                      ? s.bg
                      : Theme.of(context).colorScheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: isSelected
                        ? s.fg.withAlpha(100)
                        : Theme.of(context).colorScheme.outlineVariant,
                    width: 1,
                  ),
                ),
                child: Center(
                  child: Text(
                    s.label,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight:
                          isSelected ? FontWeight.w700 : FontWeight.w400,
                      color: isSelected
                          ? s.fg
                          : Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

// ── Priority selector ──────────────────────────────────────────────────────────

class TaskPrioritySelector extends StatelessWidget {
  final TaskPriority value;
  final ValueChanged<TaskPriority> onChanged;

  const TaskPrioritySelector({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    final options = [
      (TaskPriority.baixa, 'Baixa', Icons.south_rounded, cs.tertiary),
      (TaskPriority.media, 'Média', Icons.east_rounded, cs.secondary),
      (TaskPriority.alta, 'Alta', Icons.north_rounded, cs.error),
    ];

    return Row(
      children: options.map((opt) {
        final (priority, label, icon, color) = opt;
        final isSelected = priority == value;
        final isLast = priority == TaskPriority.alta;

        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: isLast ? 0 : 8),
            child: GestureDetector(
              onTap: () => onChanged(priority),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: isSelected ? color.withAlpha(30) : cs.surfaceContainer,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: isSelected ? color.withAlpha(120) : cs.outlineVariant,
                    width: 1,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      icon,
                      size: 16,
                      color: isSelected ? color : cs.onSurfaceVariant,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      label,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight:
                            isSelected ? FontWeight.w700 : FontWeight.w400,
                        color: isSelected ? color : cs.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
