import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/subtask.dart';
import '../../bloc/task_detail/task_detail_bloc.dart';
import '../../bloc/task_detail/task_detail_event.dart';

class TaskSubtasksSection extends StatelessWidget {
  final List<Subtask> subtarefas;
  final bool canEdit;

  const TaskSubtasksSection({
    super.key,
    required this.subtarefas,
    required this.canEdit,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final total = subtarefas.length;
    final concluidas = subtarefas.where((s) => s.concluida).length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _SectionLabel('SUBTAREFAS'),
            const SizedBox(width: 8),
            if (total > 0)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                decoration: BoxDecoration(
                  color: cs.surfaceContainerHigh,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '$concluidas/$total',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: cs.onSurfaceVariant,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 10),
        if (subtarefas.isEmpty && !canEdit)
          Text(
            'Nenhuma subtarefa',
            style: TextStyle(
              fontSize: 13,
              color: cs.onSurfaceVariant.withValues(alpha: 0.7),
              fontStyle: FontStyle.italic,
            ),
          )
        else ...[
          for (final s in subtarefas)
            _SubtaskRow(subtask: s, canEdit: canEdit),
          if (canEdit) ...[
            const SizedBox(height: 4),
            _AddSubtaskField(),
          ],
        ],
      ],
    );
  }
}

class _SubtaskRow extends StatelessWidget {
  final Subtask subtask;
  final bool canEdit;

  const _SubtaskRow({required this.subtask, required this.canEdit});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: cs.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: canEdit
              ? () => context
                  .read<TaskDetailBloc>()
                  .add(TaskDetailEvent.subtaskToggled(subtask.id))
              : null,
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: [
                _Checkbox(checked: subtask.concluida, enabled: canEdit),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    subtask.titulo,
                    style: tt.bodyMedium?.copyWith(
                      color: subtask.concluida
                          ? cs.onSurfaceVariant
                          : cs.onSurface,
                      decoration: subtask.concluida
                          ? TextDecoration.lineThrough
                          : null,
                      decorationColor: cs.onSurfaceVariant,
                      height: 1.3,
                    ),
                  ),
                ),
                if (canEdit)
                  InkWell(
                    onTap: () => context
                        .read<TaskDetailBloc>()
                        .add(TaskDetailEvent.subtaskDeleted(subtask.id)),
                    borderRadius: BorderRadius.circular(6),
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Icon(
                        Icons.close,
                        size: 16,
                        color: cs.onSurfaceVariant,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Checkbox extends StatelessWidget {
  final bool checked;
  final bool enabled;

  const _Checkbox({required this.checked, required this.enabled});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final color = enabled ? cs.primary : cs.outlineVariant;
    return Container(
      width: 18,
      height: 18,
      decoration: BoxDecoration(
        color: checked ? color : Colors.transparent,
        border: Border.all(color: color, width: 1.5),
        borderRadius: BorderRadius.circular(4),
      ),
      child: checked
          ? Icon(Icons.check, size: 14, color: cs.onPrimary)
          : null,
    );
  }
}

class _AddSubtaskField extends StatefulWidget {
  @override
  State<_AddSubtaskField> createState() => _AddSubtaskFieldState();
}

class _AddSubtaskFieldState extends State<_AddSubtaskField> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _submit() {
    final titulo = _controller.text.trim();
    if (titulo.isEmpty) return;
    context.read<TaskDetailBloc>().add(TaskDetailEvent.subtaskAdded(titulo));
    _controller.clear();
    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Material(
      color: cs.surfaceContainerLowest,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Row(
          children: [
            Icon(Icons.add, size: 18, color: cs.primary),
            const SizedBox(width: 12),
            Expanded(
              child: TextField(
                controller: _controller,
                focusNode: _focusNode,
                textInputAction: TextInputAction.done,
                onSubmitted: (_) => _submit(),
                style: TextStyle(
                  fontSize: 14,
                  color: cs.onSurface,
                  height: 1.3,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  hintText: 'Adicionar subtarefa…',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    color: cs.onSurfaceVariant.withValues(alpha: 0.7),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel(this.text);

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Text(
      text,
      style: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w700,
        color: cs.onSurfaceVariant,
        letterSpacing: 1.0,
      ),
    );
  }
}
