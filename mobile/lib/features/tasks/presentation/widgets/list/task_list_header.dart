import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/router/app_router.dart';
import '../../../../../features/authentication/presentation/bloc/auth_bloc.dart';
import '../../../../../features/authentication/presentation/bloc/auth_event.dart';
import '../../bloc/task_list/task_list_bloc.dart';
import '../../bloc/task_list/task_list_event.dart';
import '../../bloc/task_list/task_list_state.dart';
import 'filter_bottom_sheet.dart';

class TaskListHeader extends StatelessWidget {
  const TaskListHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'TRADEX TASKS',
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: tt.headlineMedium?.fontSize,
                    fontWeight: FontWeight.w800,
                    color: cs.primary,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Gerencie suas tarefas de forma simples e eficiente',
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
              await context.push(AppRoutes.taskCreate);
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
                    prev.filterDataLimiteFim != curr.filterDataLimiteFim;
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
                        ));
                  }
                },
              );
            },
          ),
          const SizedBox(width: 8),
          _HeaderAction(
            icon: Icons.logout,
            onPressed: () => context
                .read<AuthBloc>()
                .add(const AuthEvent.logoutRequested()),
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
