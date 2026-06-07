import 'package:flutter/material.dart';
import '../../domain/entities/project.dart';
import 'project_actions_sheet.dart';

enum ProjectAction { edit, share, manageColumns, ativar, pausar, concluir, delete }

class ProjectCard extends StatelessWidget {
  final Project project;
  final VoidCallback onTap;
  final ValueChanged<ProjectAction>? onAction;

  const ProjectCard({
    super.key,
    required this.project,
    required this.onTap,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final accent = _parseHex(project.cor) ?? cs.primary;
    final progress = project.progress.clamp(0.0, 1.0);

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: cs.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        elevation: 2,
        shadowColor: cs.shadow.withValues(alpha: 0.08),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 10,
                bottom: 10,
                child: Container(
                  width: 3,
                  decoration: BoxDecoration(
                    color: accent,
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
                        Container(
                          width: 22,
                          height: 22,
                          decoration: BoxDecoration(
                            color: accent.withValues(alpha: 0.18),
                            borderRadius: BorderRadius.circular(6),
                            image: project.logoUrl != null
                                ? DecorationImage(
                                    image: NetworkImage(project.logoUrl!),
                                    fit: BoxFit.cover,
                                  )
                                : null,
                          ),
                          child: project.logoUrl == null
                              ? Icon(
                                  Icons.folder_outlined,
                                  size: 14,
                                  color: accent,
                                )
                              : null,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'PRJ-${project.id.substring(0, 8).toUpperCase()}',
                          style: tt.labelSmall?.copyWith(
                            color: cs.onSurfaceVariant,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const Spacer(),
                        if (project.isOwner && project.pendingMembersCount > 0) ...[
                          _PendingBadge(count: project.pendingMembersCount),
                          const SizedBox(width: 6),
                        ],
                        _StatusBadge(status: project.status),
                        if (project.isOwner && onAction != null)
                          _CardMenu(project: project, onAction: onAction!),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      project.nome,
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
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: LinearProgressIndicator(
                              value: progress,
                              minHeight: 6,
                              backgroundColor: cs.surfaceContainerHigh,
                              valueColor: AlwaysStoppedAnimation(accent),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '${project.doneTasks}/${project.totalTasks}',
                          style: tt.bodySmall?.copyWith(
                            color: cs.onSurfaceVariant,
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

  static Color? _parseHex(String hex) {
    final clean = hex.replaceAll('#', '').trim();
    if (clean.length != 6) return null;
    final value = int.tryParse('FF$clean', radix: 16);
    return value == null ? null : Color(value);
  }
}

class _StatusBadge extends StatelessWidget {
  final ProjectStatus status;

  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final (label, bg, fg) = switch (status) {
      ProjectStatus.ativo => ('ATIVO', cs.primaryContainer, cs.onPrimaryContainer),
      ProjectStatus.pausado => (
        'PAUSADO',
        cs.tertiaryContainer,
        cs.onTertiaryContainer,
      ),
      ProjectStatus.concluido => (
        'CONCLUÍDO',
        cs.surfaceContainerHigh,
        cs.onSurfaceVariant,
      ),
    };
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

class _PendingBadge extends StatelessWidget {
  final int count;

  const _PendingBadge({required this.count});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: cs.errorContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.person_add_alt_1_rounded,
            size: 11,
            color: cs.onErrorContainer,
          ),
          const SizedBox(width: 3),
          Text(
            '$count',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w800,
              color: cs.onErrorContainer,
            ),
          ),
        ],
      ),
    );
  }
}

class _CardMenu extends StatelessWidget {
  final Project project;
  final ValueChanged<ProjectAction> onAction;

  const _CardMenu({required this.project, required this.onAction});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: () async {
          final action = await ProjectActionsSheet.show(
            context,
            project: project,
          );
          if (action != null) onAction(action);
        },
        borderRadius: BorderRadius.circular(8),
        child: SizedBox(
          width: 28,
          height: 28,
          child: Icon(Icons.more_vert, size: 18, color: cs.onSurfaceVariant),
        ),
      ),
    );
  }
}
