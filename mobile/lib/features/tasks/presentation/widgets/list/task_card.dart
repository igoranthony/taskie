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
  final VoidCallback? onLongPress;
  final VoidCallback? onLongPressDenied;
  final VoidCallback? onDelete;
  final ValueChanged<TaskStatus>? onStatusChange;
  final VoidCallback? onStatusChangeDenied;
  /// Nome da coluna (quando a task pertence a um projeto). Quando informado,
  /// o badge passa a mostrar este label em vez do status fixo.
  final String? columnLabel;
  /// Indica se a coluna da task é a "concluído" — afeta a cor do badge.
  final bool? columnIsDone;

  const TaskCard({
    super.key,
    required this.task,
    this.onTap,
    this.onLongPress,
    this.onLongPressDenied,
    this.onDelete,
    this.onStatusChange,
    this.onStatusChangeDenied,
    this.columnLabel,
    this.columnIsDone,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: cs.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        elevation: 2,
        shadowColor: cs.shadow.withValues(alpha: 0.08),
        child: InkWell(
          onTap: onTap,
          onLongPress: onLongPress != null
              ? () {
                  HapticFeedback.mediumImpact();
                  onLongPress!();
                }
              : onLongPressDenied != null
                  ? () {
                      HapticFeedback.lightImpact();
                      onLongPressDenied!();
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
                    _StatusBadge(
                      status: task.status,
                      onTap: onStatusChange != null
                          ? () => _showStatusPicker(context)
                          : onStatusChangeDenied,
                    ),
                    if (columnLabel != null) ...[
                      const SizedBox(width: 6),
                      _ColumnBadge(
                        label: columnLabel!,
                        isDone: columnIsDone ?? false,
                      ),
                    ],
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
  final VoidCallback? onTap;

  const _StatusBadge({required this.status, this.onTap});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final s = cs.statusColor(status);
    final (label, bg, fg) = (s.label.toUpperCase(), s.bg, s.fg);
    return Material(
      color: bg,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: fg,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ),
    );
  }
}

class _ColumnBadge extends StatelessWidget {
  final String label;
  final bool isDone;

  const _ColumnBadge({required this.label, required this.isDone});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final bg = isDone ? cs.primaryContainer : cs.secondaryContainer;
    final fg = isDone ? cs.onPrimaryContainer : cs.onSecondaryContainer;
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 140),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label.toUpperCase(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            color: fg,
            letterSpacing: 0.5,
          ),
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
