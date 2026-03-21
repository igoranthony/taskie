import 'package:flutter/material.dart';
import '../../../domain/entities/task.dart';
import '../../../../../core/theme/material_theme.dart';
import '../../../../../shared/extensions/datetime_extensions.dart';

class TaskDetailOverviewBody extends StatelessWidget {
  final Task task;

  const TaskDetailOverviewBody({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final (priorityLabel, priorityColor) = _priorityInfo(task.prioridade, cs);
    final bool overdue = task.dataLimite != null &&
        task.dataLimite!.isBefore(DateTime.now()) &&
        task.status != TaskStatus.concluido;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Priority ────────────────────────────────────────────
          Row(
            children: [
              Container(
                width: 3,
                height: 13,
                decoration: BoxDecoration(
                  color: priorityColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                priorityLabel,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: priorityColor,
                  letterSpacing: 1.0,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          // ── Title ───────────────────────────────────────────────
          Text(
            task.titulo,
            style: tt.headlineMedium?.copyWith(
              color: cs.onSurface,
              fontWeight: FontWeight.w800,
              height: 1.15,
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(height: 14),
          // ── Status chip ─────────────────────────────────────────
          _StatusChip(status: task.status),
          // ── Description ─────────────────────────────────────────
          if (task.descricao != null && task.descricao!.isNotEmpty) ...[
            const SizedBox(height: 28),
            _SectionLabel('DESCRIÇÃO'),
            const SizedBox(height: 8),
            Text(
              task.descricao!,
              style: tt.bodyMedium?.copyWith(
                color: cs.onSurfaceVariant,
                height: 1.65,
              ),
            ),
          ],
          // ── Updated footer ──────────────────────────────────────
          if (task.atualizadoEm.isAfter(task.criadoEm)) ...[
            const SizedBox(height: 20),
            Text(
              'Atualizado em ${task.atualizadoEm.toDateTimeBR()}',
              style: tt.bodySmall?.copyWith(
                color: cs.onSurfaceVariant.withValues(alpha: 0.55),
                fontSize: 11,
              ),
            ),
          ],
          // ── Meta grid ───────────────────────────────────────────
          const SizedBox(height: 20),
          Divider(color: cs.outlineVariant, height: 1),
          const SizedBox(height: 20),
          _MetaGrid(
            responsavel: task.atribuidoPara,
            criadoPor: task.criadoPor,
            prazo: task.dataLimite,
            criadoEm: task.criadoEm,
            overdue: overdue,
          ),
        ],
      ),
    );
  }

  static (String, Color) _priorityInfo(TaskPriority p, ColorScheme cs) {
    return switch (p) {
      TaskPriority.alta => ('PRIORIDADE ALTA', cs.error),
      TaskPriority.media => ('PRIORIDADE MÉDIA', cs.primary),
      TaskPriority.baixa => ('PRIORIDADE BAIXA', cs.secondary),
    };
  }
}

// ── Section label ──────────────────────────────────────────────────────────────

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

// ── Status chip ────────────────────────────────────────────────────────────────

class _StatusChip extends StatelessWidget {
  final TaskStatus status;
  const _StatusChip({required this.status});

  @override
  Widget build(BuildContext context) {
    final s = Theme.of(context).colorScheme.statusColor(status);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: s.bg,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(color: s.fg, shape: BoxShape.circle),
          ),
          const SizedBox(width: 6),
          Text(
            s.label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: s.fg,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Meta grid ─────────────────────────────────────────────────────────────────

class _MetaGrid extends StatelessWidget {
  final String? responsavel;
  final String criadoPor;
  final DateTime? prazo;
  final DateTime criadoEm;
  final bool overdue;

  const _MetaGrid({
    required this.responsavel,
    required this.criadoPor,
    required this.prazo,
    required this.criadoEm,
    required this.overdue,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _MetaCell(
                label: 'RESPONSÁVEL',
                value: responsavel ?? '—',
                valueColor: cs.onSurface,
                valueBold: true,
              ),
            ),
            Expanded(
              child: _MetaCell(
                label: 'CRIADO POR',
                value: criadoPor,
                valueColor: cs.onSurface,
                valueBold: true,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (prazo != null)
              Expanded(
                child: _MetaCell(
                  label: 'PRAZO',
                  value: prazo!.toDateTimeBR(),
                  valueColor: overdue ? cs.error : cs.onSurface,
                  valueBold: true,
                ),
              ),
            Expanded(
              child: _MetaCell(
                label: 'CRIADO EM',
                value: criadoEm.toDateTimeBR(),
                valueColor: cs.primary,
                valueBold: false,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// ── Meta cell ─────────────────────────────────────────────────────────────────

class _MetaCell extends StatelessWidget {
  final String label;
  final String value;
  final Color valueColor;
  final bool valueBold;

  const _MetaCell({
    required this.label,
    required this.value,
    required this.valueColor,
    required this.valueBold,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            color: cs.onSurfaceVariant,
            letterSpacing: 0.8,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: valueBold ? FontWeight.w600 : FontWeight.w400,
            color: valueColor,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
