import 'package:flutter/material.dart';
import '../../domain/entities/project.dart';
import 'project_card.dart';

class ProjectActionsSheet {
  ProjectActionsSheet._();

  static Future<ProjectAction?> show(
    BuildContext context, {
    required Project project,
  }) {
    return showModalBottomSheet<ProjectAction>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) => SafeArea(
        top: false,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.sizeOf(sheetContext).height * 0.88,
          ),
          child: SingleChildScrollView(
            child: _Sheet(project: project),
          ),
        ),
      ),
    );
  }
}

class _Sheet extends StatelessWidget {
  final Project project;

  const _Sheet({required this.project});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.fromLTRB(12, 0, 12, 24),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          Container(
            width: 36,
            height: 4,
            decoration: BoxDecoration(
              color: cs.outlineVariant,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: cs.surfaceContainer,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        'PRJ-${project.id.substring(0, 8).toUpperCase()}',
                        style: tt.labelSmall?.copyWith(
                          color: cs.onSurfaceVariant,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        project.nome,
                        style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  'Ações do projeto',
                  style: tt.titleMedium?.copyWith(
                    color: cs.onSurface,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Column(
              children: [
                _ActionOption(
                  icon: Icons.edit_outlined,
                  label: 'Editar',
                  action: ProjectAction.edit,
                ),
                _ActionOption(
                  icon: Icons.share_outlined,
                  label: 'Compartilhar',
                  action: ProjectAction.share,
                ),
                _ActionOption(
                  icon: Icons.view_column_outlined,
                  label: 'Gerenciar colunas',
                  action: ProjectAction.manageColumns,
                ),
                if (project.status != ProjectStatus.ativo)
                  _ActionOption(
                    icon: Icons.play_arrow_outlined,
                    label: 'Marcar como ativo',
                    action: ProjectAction.ativar,
                  ),
                if (project.status != ProjectStatus.pausado)
                  _ActionOption(
                    icon: Icons.pause_outlined,
                    label: 'Pausar',
                    action: ProjectAction.pausar,
                  ),
                if (project.status != ProjectStatus.concluido)
                  _ActionOption(
                    icon: Icons.check_circle_outline,
                    label: 'Concluir',
                    action: ProjectAction.concluir,
                  ),
                const _ActionOption(
                  icon: Icons.delete_outline,
                  label: 'Excluir',
                  action: ProjectAction.delete,
                  destructive: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final ProjectAction action;
  final bool destructive;

  const _ActionOption({
    required this.icon,
    required this.label,
    required this.action,
    this.destructive = false,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final fg = destructive ? cs.error : cs.onSurface;
    final bgOnTap = destructive ? cs.errorContainer : cs.surfaceContainer;

    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          onTap: () => Navigator.pop(context, action),
          borderRadius: BorderRadius.circular(14),
          splashColor: bgOnTap.withValues(alpha: 0.4),
          highlightColor: bgOnTap.withValues(alpha: 0.2),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: destructive
                        ? cs.errorContainer.withValues(alpha: 0.4)
                        : cs.surfaceContainer,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, size: 18, color: fg),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    label,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: fg,
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
