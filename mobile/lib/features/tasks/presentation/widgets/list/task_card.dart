import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../domain/entities/task.dart';
import '../../../../../core/theme/material_theme.dart';
import '../../../../../shared/extensions/datetime_extensions.dart';
import '../common/task_priority_badge.dart';
import '../common/task_status_picker.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;
  final ValueChanged<TaskStatus>? onStatusChange;

  const TaskCard({
    super.key,
    required this.task,
    this.onTap,
    this.onDelete,
    this.onStatusChange,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: cs.surfaceContainer,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: onTap,
          onLongPress: onStatusChange != null
              ? () {
                  HapticFeedback.mediumImpact();
                  _showStatusPicker(context);
                }
              : null,
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              // Left accent bar — only for editable (my) tasks
              if (task.canEdit)
                Positioned(
                  left: 0,
                  top: 10,
                  bottom: 10,
                  child: Container(
                    width: 3,
                    decoration: BoxDecoration(
                      color: cs.primary,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    TaskPriorityBadge(prioridade: task.prioridade, iconSize: 16),
                    const SizedBox(width: 6),
                    Text(
                      'TRX-${task.id.substring(0, 8).toUpperCase()}',
                      style: tt.labelSmall?.copyWith(
                        color: cs.onSurfaceVariant,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const Spacer(),
                    _StatusBadge(status: task.status),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  task.titulo,
                  style: tt.titleSmall?.copyWith(
                    color: cs.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _AssigneeAvatar(name: task.atribuidoPara ?? task.criadoPor),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        task.atribuidoPara ?? task.criadoPor,
                        style: tt.bodySmall?.copyWith(
                          color: cs.onSurfaceVariant,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      _displayDate(),
                      style: tt.bodySmall?.copyWith(
                        color: _isOverdue() ? cs.error : cs.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
              ],
            ),
        ),
      ),
    );
  }

  void _showStatusPicker(BuildContext context) {
    TaskStatusPicker.show(context, task: task, onStatusChange: onStatusChange!);
  }

  String _displayDate() {
    return (task.dataLimite ?? task.criadoEm).toDateBR();
  }

  bool _isOverdue() {
    return task.dataLimite != null &&
        task.dataLimite!.isBefore(DateTime.now()) &&
        task.status != TaskStatus.concluido;
  }
}

// ── Supporting widgets ────────────────────────────────────────────────────────

class _StatusBadge extends StatelessWidget {
  final TaskStatus status;

  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final s = cs.statusColor(status);
    final (label, bg, fg) = (s.label.toUpperCase(), s.bg, s.fg);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: fg,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

class _AssigneeAvatar extends StatelessWidget {
  final String name;

  const _AssigneeAvatar({required this.name});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return CircleAvatar(
      radius: 12,
      backgroundColor: cs.secondaryContainer,
      child: Text(
        _initials(name),
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: cs.onSecondaryContainer,
        ),
      ),
    );
  }

  String _initials(String name) {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty) return '?';
    if (parts.length == 1) return parts[0][0].toUpperCase();
    return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
  }
}
