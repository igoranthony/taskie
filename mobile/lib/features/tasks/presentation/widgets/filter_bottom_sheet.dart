import 'package:flutter/material.dart';
import '../../domain/entities/task.dart';

class FilterBottomSheet extends StatelessWidget {
  final TaskStatus? currentFilter;
  final ValueChanged<TaskStatus?> onFilterChanged;

  const FilterBottomSheet({
    super.key,
    required this.onFilterChanged,
    this.currentFilter,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Filtrar por status',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 8),
            _FilterOption(
              label: 'Todos',
              isSelected: currentFilter == null,
              onTap: () {
                onFilterChanged(null);
                Navigator.pop(context);
              },
            ),
            _FilterOption(
              label: 'Backlog',
              color: cs.outline,
              isSelected: currentFilter == TaskStatus.backlog,
              onTap: () {
                onFilterChanged(TaskStatus.backlog);
                Navigator.pop(context);
              },
            ),
            _FilterOption(
              label: 'Em Andamento',
              color: cs.primary,
              isSelected: currentFilter == TaskStatus.emAndamento,
              onTap: () {
                onFilterChanged(TaskStatus.emAndamento);
                Navigator.pop(context);
              },
            ),
            _FilterOption(
              label: 'Concluído',
              color: cs.tertiary,
              isSelected: currentFilter == TaskStatus.concluido,
              onTap: () {
                onFilterChanged(TaskStatus.concluido);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterOption extends StatelessWidget {
  final String label;
  final Color? color;
  final bool isSelected;
  final VoidCallback onTap;

  const _FilterOption({
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return ListTile(
      leading: CircleAvatar(
        radius: 6,
        backgroundColor: color ?? cs.onSurfaceVariant,
      ),
      title: Text(label),
      trailing: isSelected
          ? Icon(Icons.check, color: cs.primary)
          : null,
      onTap: onTap,
    );
  }
}
