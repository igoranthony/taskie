import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/router/app_router.dart';
import '../../../../../features/authentication/presentation/bloc/auth_bloc.dart';
import '../../../../../features/authentication/presentation/bloc/auth_event.dart';
import '../../../../../features/authentication/presentation/bloc/auth_state.dart';
import '../../bloc/task_list/task_list_bloc.dart';
import '../../bloc/task_list/task_list_event.dart';
import '../../bloc/task_list/task_list_state.dart';
import 'filter_bottom_sheet.dart';
import '../../../../../shared/widgets/confirm_dialog.dart';

class TaskListHeader extends StatelessWidget {
  /// Quando definido, troca o título "TASKIE" pelo nome do projeto.
  final String? projectName;
  /// Quando true, exibe um botão de voltar à esquerda.
  final bool showBack;

  const TaskListHeader({
    super.key,
    this.projectName,
    this.showBack = false,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showBack) ...[
            _HeaderAction(
              icon: Icons.arrow_back,
              onPressed: () => Navigator.of(context).maybePop(),
            ),
            const SizedBox(width: 8),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                projectName != null
                    ? Text(
                        projectName!,
                        style: tt.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: cs.onSurface,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                    : Text(
                        'TASKIE',
                        style: GoogleFonts.pressStart2p(
                          fontSize: 13,
                          color: cs.primary,
                          height: 1.6,
                        ),
                      ),
                const SizedBox(height: 2),
                Text(
                  projectName != null
                      ? 'Tarefas deste projeto'
                      : 'Gerencie suas tarefas de forma simples e eficiente',
                  style: tt.bodySmall?.copyWith(
                    color: cs.onSurfaceVariant,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          _HeaderAction(
            icon: Icons.add,
            onPressed: () async {
              final state = context.read<TaskListBloc>().state;
              final projetoId = state is TaskListSuccess ? state.projetoId : null;
              await context.push(
                AppRoutes.taskCreate,
                extra: projetoId,
              );
              if (context.mounted) {
                context
                    .read<TaskListBloc>()
                    .add(const TaskListEvent.refreshed());
              }
            },
          ),
          const SizedBox(width: 8),
          BlocBuilder<TaskListBloc, TaskListState>(
            buildWhen: (prev, curr) {
              if (prev is TaskListSuccess && curr is TaskListSuccess) {
                return prev.filterPrioridade != curr.filterPrioridade ||
                    prev.filterSearch != curr.filterSearch ||
                    prev.filterCriadoPor != curr.filterCriadoPor ||
                    prev.filterAtribuidoPara != curr.filterAtribuidoPara ||
                    prev.filterCriadoEmInicio != curr.filterCriadoEmInicio ||
                    prev.filterCriadoEmFim != curr.filterCriadoEmFim ||
                    prev.filterDataLimiteInicio != curr.filterDataLimiteInicio ||
                    prev.filterDataLimiteFim != curr.filterDataLimiteFim ||
                    prev.colunaId != curr.colunaId;
              }
              return prev.runtimeType != curr.runtimeType;
            },
            builder: (context, state) {
              final success = state is TaskListSuccess ? state : null;
              final currentFilter = TaskFilterResult(
                prioridade: success?.filterPrioridade,
                search: success?.filterSearch,
                criadoPor: success?.filterCriadoPor,
                atribuidoPara: success?.filterAtribuidoPara,
                criadoEmInicio: success?.filterCriadoEmInicio,
                criadoEmFim: success?.filterCriadoEmFim,
                dataLimiteInicio: success?.filterDataLimiteInicio,
                dataLimiteFim: success?.filterDataLimiteFim,
              );
              return _FilterButton(
                hasActiveFilter: currentFilter.hasActiveFilters,
                onPressed: () async {
                  final result = await FilterBottomSheet.show(
                    context,
                    current: currentFilter,
                  );
                  if (result != null && context.mounted) {
                    context.read<TaskListBloc>().add(TaskListEvent.filtered(
                          status: success?.filterStatus,
                          prioridade: result.prioridade,
                          search: result.search,
                          criadoPor: result.criadoPor,
                          atribuidoPara: result.atribuidoPara,
                          criadoEmInicio: result.criadoEmInicio,
                          criadoEmFim: result.criadoEmFim,
                          dataLimiteInicio: result.dataLimiteInicio,
                          dataLimiteFim: result.dataLimiteFim,
                          colunaId: success?.colunaId,
                        ));
                  }
                },
              );
            },
          ),
          const SizedBox(width: 8),
          _HeaderAction(
            icon: Icons.logout,
            onPressed: () => ConfirmDialog.show(
              context,
              title: 'Sair',
              message: 'Tem certeza que deseja sair da sua conta?',
              confirmLabel: 'Sair',
              onConfirm: () async {
                final authBloc = context.read<AuthBloc>();
                final completer = Completer<void>();
                late StreamSubscription sub;
                sub = authBloc.stream.listen((state) {
                  state.whenOrNull(
                    unauthenticated: () {
                      if (!completer.isCompleted) completer.complete();
                      sub.cancel();
                    },
                  );
                });
                authBloc.add(const AuthEvent.logoutRequested());
                await completer.future;
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterButton extends StatelessWidget {
  final bool hasActiveFilter;
  final VoidCallback onPressed;

  const _FilterButton({required this.hasActiveFilter, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Material(
          color: hasActiveFilter ? cs.primaryContainer : cs.surfaceContainer,
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              width: 40,
              height: 40,
              child: Icon(
                Icons.tune,
                size: 20,
                color: hasActiveFilter ? cs.onPrimaryContainer : cs.onSurface,
              ),
            ),
          ),
        ),
        if (hasActiveFilter)
          Positioned(
            top: -2,
            right: -2,
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: cs.primary,
                shape: BoxShape.circle,
              ),
            ),
          ),
      ],
    );
  }
}

class _HeaderAction extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _HeaderAction({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Material(
      color: cs.surfaceContainer,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(12),
        child: SizedBox(
          width: 40,
          height: 40,
          child: Icon(icon, size: 20, color: cs.onSurface),
        ),
      ),
    );
  }
}
