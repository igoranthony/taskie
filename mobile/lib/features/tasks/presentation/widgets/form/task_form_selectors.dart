import 'package:flutter/material.dart';
import '../../../domain/entities/task.dart';
import '../../../../../core/theme/material_theme.dart';

// ── Status selector ────────────────────────────────────────────────────────────

class TaskStatusSelector extends StatelessWidget {
  final TaskStatus value;
  final ValueChanged<TaskStatus> onChanged;
  final bool isLocked;

  const TaskStatusSelector({
    super.key,
    required this.value,
    required this.onChanged,
    this.isLocked = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: TaskStatus.values.map((status) {
        final isSelected = status == value;
        final isDisabled = isLocked && status != value;
        final s = Theme.of(context).colorScheme.statusColor(status);
        final cs = Theme.of(context).colorScheme;
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              right: status != TaskStatus.values.last ? 8 : 0,
            ),
            child: GestureDetector(
              onTap: isDisabled ? null : () => onChanged(status),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: isDisabled
                      ? cs.surfaceContainer.withAlpha(120)
                      : isSelected
                          ? s.bg
                          : cs.surfaceContainer,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: isDisabled
                        ? cs.outlineVariant.withAlpha(80)
                        : isSelected
                            ? s.fg.withAlpha(100)
                            : cs.outlineVariant,
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
                      color: isDisabled
                          ? cs.onSurfaceVariant.withAlpha(80)
                          : isSelected
                              ? s.fg
                              : cs.onSurfaceVariant,
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

    return Row(
      children: TaskPriority.values.map((priority) {
        final p = cs.priorityColor(priority);
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
                  color: isSelected ? p.color.withAlpha(30) : cs.surfaceContainer,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: isSelected ? p.color.withAlpha(120) : cs.outlineVariant,
                    width: 1,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      p.icon,
                      size: 16,
                      color: isSelected ? p.color : cs.onSurfaceVariant,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      p.label,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight:
                            isSelected ? FontWeight.w700 : FontWeight.w400,
                        color: isSelected ? p.color : cs.onSurfaceVariant,
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
