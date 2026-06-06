import 'package:flutter/material.dart';
import '../../domain/entities/project.dart';

enum ProjectAction { edit, ativar, pausar, concluir, delete }

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
                          ),
                          child: Icon(
                            Icons.folder_outlined,
                            size: 14,
                            color: accent,
                          ),
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

class _CardMenu extends StatelessWidget {
  final Project project;
  final ValueChanged<ProjectAction> onAction;

  const _CardMenu({required this.project, required this.onAction});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 28,
      height: 28,
      child: PopupMenuButton<ProjectAction>(
        padding: EdgeInsets.zero,
        icon: const Icon(Icons.more_vert, size: 18),
        onSelected: onAction,
        itemBuilder: (_) {
          final items = <PopupMenuEntry<ProjectAction>>[
            const PopupMenuItem(
              value: ProjectAction.edit,
              child: Row(children: [
                Icon(Icons.edit_outlined, size: 18),
                SizedBox(width: 12),
                Text('Editar'),
              ]),
            ),
          ];
          if (project.status != ProjectStatus.ativo) {
            items.add(const PopupMenuItem(
              value: ProjectAction.ativar,
              child: Row(children: [
                Icon(Icons.play_arrow_outlined, size: 18),
                SizedBox(width: 12),
                Text('Marcar como ativo'),
              ]),
            ));
          }
          if (project.status != ProjectStatus.pausado) {
            items.add(const PopupMenuItem(
              value: ProjectAction.pausar,
              child: Row(children: [
                Icon(Icons.pause_outlined, size: 18),
                SizedBox(width: 12),
                Text('Pausar'),
              ]),
            ));
          }
          if (project.status != ProjectStatus.concluido) {
            items.add(const PopupMenuItem(
              value: ProjectAction.concluir,
              child: Row(children: [
                Icon(Icons.check_circle_outline, size: 18),
                SizedBox(width: 12),
                Text('Concluir'),
              ]),
            ));
          }
          items.add(const PopupMenuDivider());
          items.add(const PopupMenuItem(
            value: ProjectAction.delete,
            child: Row(children: [
              Icon(Icons.delete_outline, size: 18, color: Colors.red),
              SizedBox(width: 12),
              Text('Excluir', style: TextStyle(color: Colors.red)),
            ]),
          ));
          return items;
        },
      ),
    );
  }
}
