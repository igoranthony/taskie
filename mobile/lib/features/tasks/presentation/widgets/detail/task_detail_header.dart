import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TaskDetailHeader extends StatelessWidget {
  final String taskId;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const TaskDetailHeader({
    super.key,
    required this.taskId,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final code = 'TRX-${taskId.substring(0, 8).toUpperCase()}';

    return Stack(
      alignment: Alignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _ActionBtn(
              icon: Icons.arrow_back,
              onPressed: () => context.pop(),
            ),
            Row(
              children: [
                if (onEdit != null) ...[
                  _ActionBtn(icon: Icons.edit_outlined, onPressed: onEdit!),
                  const SizedBox(width: 8),
                ],
                if (onDelete != null)
                  _ActionBtn(
                    icon: Icons.delete_outline,
                    onPressed: onDelete!,
                    color: cs.error,
                  ),
              ],
            ),
          ],
        ),
        Text(
          code,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: cs.onSurface,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
        ),
      ],
    );
  }
}

class _ActionBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color? color;

  const _ActionBtn({
    required this.icon,
    required this.onPressed,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Material(
      color: cs.surfaceContainer,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(10),
        child: SizedBox(
          width: 38,
          height: 38,
          child: Icon(icon, size: 18, color: color ?? cs.onSurface),
        ),
      ),
    );
  }
}
