import 'package:flutter/material.dart';
import '../../../domain/entities/task.dart';

class FilterPrioritySection extends StatelessWidget {
  final TaskPriority? value;
  final ValueChanged<TaskPriority?> onChanged;

  const FilterPrioritySection({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Prioridade',
          style: tt.labelMedium?.copyWith(
            color: cs.onSurfaceVariant,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: [
            _FilterChip(label: 'Todas', isSelected: value == null, onTap: () => onChanged(null)),
            _FilterChip(label: 'Alta', color: cs.error, isSelected: value == TaskPriority.alta, onTap: () => onChanged(TaskPriority.alta)),
            _FilterChip(label: 'Média', color: cs.tertiary, isSelected: value == TaskPriority.media, onTap: () => onChanged(TaskPriority.media)),
            _FilterChip(label: 'Baixa', color: cs.primary, isSelected: value == TaskPriority.baixa, onTap: () => onChanged(TaskPriority.baixa)),
          ],
        ),
      ],
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final Color? color;
  final bool isSelected;
  final VoidCallback onTap;

  const _FilterChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final chipColor = color ?? cs.onSurfaceVariant;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? chipColor.withValues(alpha: 0.15) : cs.surfaceContainer,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? chipColor : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: isSelected ? chipColor : cs.onSurfaceVariant,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
        ),
      ),
    );
  }
}
