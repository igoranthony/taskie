import 'package:flutter/material.dart';
import '../../../../projects/domain/entities/project_column.dart';
import '../../../domain/entities/task.dart';

class TaskFilterTabs extends StatelessWidget {
  final TaskStatus? currentFilter;
  final String? currentColumnId;
  final List<ProjectColumn>? projectColumns;
  final ValueChanged<TaskStatus?> onFilterChanged;
  final ValueChanged<String?> onColumnChanged;

  const TaskFilterTabs({
    super.key,
    required this.currentFilter,
    required this.currentColumnId,
    required this.projectColumns,
    required this.onFilterChanged,
    required this.onColumnChanged,
  });

  bool get _usesProjectColumns => projectColumns != null;

  @override
  Widget build(BuildContext context) {
    final tabs = _usesProjectColumns ? _buildColumnTabs() : _buildStatusTabs();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(children: tabs),
    );
  }

  List<Widget> _buildStatusTabs() {
    return _withSpacing([
      _FilterTab(
        label: 'Todas',
        isActive: currentFilter == null,
        onTap: () => onFilterChanged(null),
      ),
      _FilterTab(
        label: 'Backlog',
        isActive: currentFilter == TaskStatus.backlog,
        onTap: () => onFilterChanged(TaskStatus.backlog),
      ),
      _FilterTab(
        label: 'Em Andamento',
        isActive: currentFilter == TaskStatus.emAndamento,
        onTap: () => onFilterChanged(TaskStatus.emAndamento),
      ),
      _FilterTab(
        label: 'Concluido',
        isActive: currentFilter == TaskStatus.concluido,
        onTap: () => onFilterChanged(TaskStatus.concluido),
      ),
    ]);
  }

  List<Widget> _buildColumnTabs() {
    final columns = projectColumns ?? const <ProjectColumn>[];
    return _withSpacing([
      _FilterTab(
        label: 'Todas',
        isActive: currentColumnId == null,
        onTap: () => onColumnChanged(null),
      ),
      ...columns.map(
        (column) => _FilterTab(
          label: column.nome,
          isActive: currentColumnId == column.id,
          onTap: () => onColumnChanged(column.id),
        ),
      ),
    ]);
  }

  List<Widget> _withSpacing(List<Widget> tabs) {
    return [
      for (var i = 0; i < tabs.length; i++) ...[
        if (i > 0) const SizedBox(width: 8),
        tabs[i],
      ],
    ];
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
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
