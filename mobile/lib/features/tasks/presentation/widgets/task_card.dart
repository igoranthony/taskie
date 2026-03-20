import 'package:flutter/material.dart';
import '../../domain/entities/task.dart';
import '../../../../shared/extensions/datetime_extensions.dart';
import 'task_status_badge.dart';
import 'task_priority_badge.dart';
import '../../../../shared/widgets/app_icon_button.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  const TaskCard({
    super.key,
    required this.task,
    this.onTap,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  TaskPriorityBadge(prioridade: task.prioridade),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      task.titulo,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  TaskStatusBadge(
                    status: task.status,
                    style: TaskStatusBadgeStyle.compact,
                  ),
                ],
              ),
              if (task.descricao != null && task.descricao!.isNotEmpty) ...[
                const SizedBox(height: 8),
                Text(
                  task.descricao!,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: cs.onSurfaceVariant,
                      ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(Icons.calendar_today, size: 14, color: cs.outline),
                  const SizedBox(width: 4),
                  Text(
                    task.criadoEm.toDateBR(),
                    style: TextStyle(color: cs.outline, fontSize: 12),
                  ),
                  if (task.dataLimite != null) ...[
                    const SizedBox(width: 16),
                    Icon(
                      Icons.event,
                      size: 14,
                      color: _isOverdue(task.dataLimite!)
                          ? cs.error
                          : cs.outline,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      task.dataLimite!.toDateBR(),
                      style: TextStyle(
                        color: _isOverdue(task.dataLimite!)
                            ? cs.error
                            : cs.outline,
                        fontSize: 12,
                      ),
                    ),
                  ],
                  const Spacer(),
                  if (onDelete != null)
                    AppIconButton(
                      icon: Icons.delete_outline,
                      semanticLabel: 'Excluir tarefa ${task.titulo}',
                      onPressed: onDelete,
                      iconSize: 20,
                      color: cs.outline,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _isOverdue(DateTime deadline) {
    return deadline.isBefore(DateTime.now()) &&
        task.status != TaskStatus.concluido;
  }
}
