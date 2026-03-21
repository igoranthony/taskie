import 'package:flutter/material.dart';
import '../../../domain/entities/task.dart';

class TaskFilterTabs extends StatelessWidget {
  final TaskStatus? currentFilter;
  final ValueChanged<TaskStatus?> onFilterChanged;

  const TaskFilterTabs({
    super.key,
    required this.currentFilter,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          _FilterTab(
            label: 'Todas',
            isActive: currentFilter == null,
            onTap: () => onFilterChanged(null),
          ),
          const SizedBox(width: 8),
          _FilterTab(
            label: 'Backlog',
            isActive: currentFilter == TaskStatus.backlog,
            onTap: () => onFilterChanged(TaskStatus.backlog),
          ),
          const SizedBox(width: 8),
          _FilterTab(
            label: 'Em Andamento',
            isActive: currentFilter == TaskStatus.emAndamento,
            onTap: () => onFilterChanged(TaskStatus.emAndamento),
          ),
          const SizedBox(width: 8),
          _FilterTab(
            label: 'Concluído',
            isActive: currentFilter == TaskStatus.concluido,
            onTap: () => onFilterChanged(TaskStatus.concluido),
          ),
        ],
      ),
    );
  }
}

class _FilterTab extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _FilterTab({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? cs.primary : cs.surfaceContainer,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: isActive ? cs.onPrimary : cs.onSurfaceVariant,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
              ),
        ),
      ),
    );
  }
}
