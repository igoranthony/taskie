import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/errors/app_error_parser.dart';
import '../../../../shared/widgets/app_empty_state.dart';
import '../../../../shared/widgets/app_error_widget.dart';
import '../../../../shared/widgets/app_loading.dart';
import '../../../../shared/widgets/app_primary_button.dart';
import '../../../../shared/widgets/app_snackbar.dart';
import '../../../../shared/widgets/confirm_dialog.dart';
import '../../domain/entities/project_column.dart';
import '../../domain/repositories/column_repository.dart';
import '../../domain/usecases/column_use_cases.dart';
import '../../domain/usecases/get_project_columns.dart';
import '../cubit/project_columns_cubit.dart';
import '../cubit/project_columns_state.dart';

class ColumnManagePage extends StatelessWidget {
  final String projectId;

  const ColumnManagePage({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          ProjectColumnsCubit(getIt<GetProjectColumns>())..load(projectId),
      child: _ColumnManageView(projectId: projectId),
    );
  }
}

class _ColumnManageView extends StatelessWidget {
  final String projectId;

  const _ColumnManageView({required this.projectId});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: cs.surface,
      body: SafeArea(
        child: Column(
          children: [
            _Header(projectId: projectId),
            const SizedBox(height: 16),
            Expanded(child: _Content(projectId: projectId)),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final String projectId;

  const _Header({required this.projectId});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: _HeaderButton(
              icon: Icons.arrow_back,
              onTap: () => context.pop(),
            ),
          ),
          Text(
            'Colunas',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: cs.onSurface,
                  fontWeight: FontWeight.w600,
                ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: _HeaderButton(
              icon: Icons.add,
              onTap: () => _createColumn(context, projectId),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _createColumn(BuildContext context, String projectId) async {
    final cubit = context.read<ProjectColumnsCubit>();
    final columns = cubit.state is ProjectColumnsLoaded
        ? (cubit.state as ProjectColumnsLoaded).columns
        : const <ProjectColumn>[];
    final result = await _ColumnFormSheet.show(context);
    if (result == null || !context.mounted) return;

    try {
      await getIt<CreateColumn>().call(
        projectId: projectId,
        nome: result.name,
        posicao: _nextPosition(columns),
        isDoneColumn: result.isDoneColumn,
      );
      if (!context.mounted) return;
      AppSnackbar.success(context, 'Coluna criada.');
      await cubit.load(projectId);
    } catch (e) {
      if (context.mounted) {
        AppSnackbar.error(context, AppErrorParser.parse(e));
      }
    }
  }

  int _nextPosition(List<ProjectColumn> columns) {
    if (columns.isEmpty) return 0;
    return columns
            .map((column) => column.posicao)
            .reduce((a, b) => a > b ? a : b) +
        1;
  }
}

class _HeaderButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _HeaderButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Material(
      color: cs.surfaceContainer,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: SizedBox(
          width: 38,
          height: 38,
          child: Icon(icon, size: 18, color: cs.onSurface),
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  final String projectId;

  const _Content({required this.projectId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectColumnsCubit, ProjectColumnsState>(
      builder: (context, state) => state.when(
        initial: () => const Center(child: AppLoading()),
        loading: () => const Center(child: AppLoading()),
        loaded: (columns) {
          if (columns.isEmpty) {
            return const AppEmptyState(
              icon: Icons.view_column_outlined,
              title: 'Nenhuma coluna',
              subtitle: 'Toque em + para criar a primeira coluna',
            );
          }
          return _ColumnReorderList(
            projectId: projectId,
            columns: columns,
          );
        },
        failure: (message) => AppErrorWidget(
          error: message,
          message: 'Erro ao carregar colunas',
          onRetry: () => context.read<ProjectColumnsCubit>().load(projectId),
        ),
      ),
    );
  }
}

class _ColumnReorderList extends StatefulWidget {
  final String projectId;
  final List<ProjectColumn> columns;

  const _ColumnReorderList({
    required this.projectId,
    required this.columns,
  });

  @override
  State<_ColumnReorderList> createState() => _ColumnReorderListState();
}

class _ColumnReorderListState extends State<_ColumnReorderList> {
  late List<ProjectColumn> _columns;
  bool _savingOrder = false;

  @override
  void initState() {
    super.initState();
    _columns = List.of(widget.columns);
  }

  @override
  void didUpdateWidget(covariant _ColumnReorderList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.columns != widget.columns) {
      _columns = List.of(widget.columns);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Stack(
      children: [
        RefreshIndicator(
          onRefresh: () =>
              context.read<ProjectColumnsCubit>().load(widget.projectId),
          child: ReorderableListView.builder(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
            buildDefaultDragHandles: false,
            itemCount: _columns.length,
            onReorder: _reorder,
            proxyDecorator: _dragProxyDecorator,
            itemBuilder: (_, index) => _ColumnRow(
              key: ValueKey(_columns[index].id),
              projectId: widget.projectId,
              column: _columns[index],
              reorderIndex: index,
            ),
          ),
        ),
        if (_savingOrder)
          Positioned(
            top: 0,
            left: 16,
            right: 16,
            child: LinearProgressIndicator(
              minHeight: 2,
              color: cs.primary,
              backgroundColor: Colors.transparent,
            ),
          ),
      ],
    );
  }

  Future<void> _reorder(int oldIndex, int newIndex) async {
    if (_savingOrder) return;
    if (newIndex > oldIndex) newIndex -= 1;
    if (oldIndex == newIndex) return;

    final previous = List<ProjectColumn>.of(_columns);
    final reordered = List<ProjectColumn>.of(_columns);
    final moved = reordered.removeAt(oldIndex);
    reordered.insert(newIndex, moved);

    setState(() {
      _columns = reordered;
      _savingOrder = true;
    });

    try {
      final ids = reordered.map((column) => column.id).toList();
      debugPrint(
        '[ColumnReorder] start projectId=${widget.projectId} '
        'oldIndex=$oldIndex newIndex=$newIndex ids=$ids',
      );
      debugPrint(
        '[ColumnReorder] ReorderColumns registered='
        '${getIt.isRegistered<ReorderColumns>()}',
      );

      final reorderColumns = getIt.isRegistered<ReorderColumns>()
          ? getIt<ReorderColumns>()
          : ReorderColumns(getIt<ColumnRepository>());

      debugPrint('[ColumnReorder] calling reorder endpoint');
      await reorderColumns.call(
        projectId: widget.projectId,
        ids: ids,
      );
      if (!mounted) return;
      debugPrint('[ColumnReorder] reorder saved');
      AppSnackbar.success(context, 'Ordem das colunas salva.');
      await context.read<ProjectColumnsCubit>().load(widget.projectId);
    } catch (e, stackTrace) {
      debugPrint('[ColumnReorder] error: ${e.runtimeType} - $e');
      debugPrintStack(
        label: '[ColumnReorder] stack',
        stackTrace: stackTrace,
      );
      if (!mounted) return;
      setState(() => _columns = previous);
      AppSnackbar.error(context, AppErrorParser.parse(e));
    } finally {
      if (mounted) setState(() => _savingOrder = false);
    }
  }

  Widget _dragProxyDecorator(
    Widget child,
    int index,
    Animation<double> animation,
  ) {
    return AnimatedBuilder(
      animation: animation,
      child: child,
      builder: (context, child) {
        final progress = Curves.easeOut.transform(animation.value);
        return Transform.scale(
          scale: 1 + progress * 0.015,
          child: Material(
            color: Colors.transparent,
            shadowColor:
                Theme.of(context).colorScheme.shadow.withValues(alpha: 0.12),
            elevation: 6,
            borderRadius: BorderRadius.circular(14),
            child: child,
          ),
        );
      },
    );
  }
}

class _ColumnRow extends StatelessWidget {
  final String projectId;
  final ProjectColumn column;
  final int reorderIndex;

  const _ColumnRow({
    super.key,
    required this.projectId,
    required this.column,
    required this.reorderIndex,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Material(
        color: cs.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(14),
        elevation: 2,
        shadowColor: cs.shadow.withValues(alpha: 0.08),
        child: InkWell(
          onTap: () => _renameColumn(context),
          borderRadius: BorderRadius.circular(14),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 8, 14),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: column.isDoneColumn
                        ? cs.primaryContainer
                        : cs.secondaryContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    column.isDoneColumn
                        ? Icons.check_rounded
                        : Icons.view_column_outlined,
                    size: 16,
                    color: column.isDoneColumn
                        ? cs.onPrimaryContainer
                        : cs.onSecondaryContainer,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          column.nome,
                          style: tt.titleSmall?.copyWith(
                            color: cs.onSurface,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (column.isDoneColumn) ...[
                        const SizedBox(width: 8),
                        _DoneBadge(colorScheme: cs),
                      ],
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.delete_outline, size: 18, color: cs.error),
                  onPressed: () => _confirmDelete(context),
                ),
                ReorderableDragStartListener(
                  index: reorderIndex,
                  child: SizedBox(
                    width: 36,
                    height: 36,
                    child: Icon(
                      Icons.drag_handle_rounded,
                      size: 20,
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

  Future<void> _renameColumn(BuildContext context) async {
    final cubit = context.read<ProjectColumnsCubit>();
    final result = await _ColumnFormSheet.show(context, initial: column);
    if (result == null || !context.mounted) return;

    try {
      await getIt<UpdateColumn>().call(
        id: column.id,
        nome: result.name,
        isDoneColumn: column.isDoneColumn,
      );
      if (!context.mounted) return;
      AppSnackbar.success(context, 'Coluna atualizada.');
      await cubit.load(projectId);
    } catch (e) {
      if (context.mounted) {
        AppSnackbar.error(context, AppErrorParser.parse(e));
      }
    }
  }

  Future<void> _confirmDelete(BuildContext context) async {
    final cubit = context.read<ProjectColumnsCubit>();
    final confirmed = await ConfirmDialog.show(
      context,
      title: 'Excluir coluna',
      message: 'Excluir "${column.nome}"?',
      confirmLabel: 'Excluir',
      destructive: true,
    );
    if (!confirmed || !context.mounted) return;

    try {
      await getIt<DeleteColumn>().call(column.id);
      if (!context.mounted) return;
      AppSnackbar.success(context, 'Coluna excluida.');
      await cubit.load(projectId);
    } catch (e) {
      if (context.mounted) {
        AppSnackbar.error(context, AppErrorParser.parse(e));
      }
    }
  }
}

class _DoneBadge extends StatelessWidget {
  final ColorScheme colorScheme;

  const _DoneBadge({required this.colorScheme});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        'CONCLUIDO',
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: colorScheme.onPrimaryContainer,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

class _ColumnFormResult {
  final String name;
  final bool isDoneColumn;

  const _ColumnFormResult({
    required this.name,
    required this.isDoneColumn,
  });
}

class _ColumnFormSheet extends StatefulWidget {
  final ProjectColumn? initial;

  const _ColumnFormSheet({this.initial});

  static Future<_ColumnFormResult?> show(
    BuildContext context, {
    ProjectColumn? initial,
  }) {
    return showModalBottomSheet<_ColumnFormResult>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) => AnimatedPadding(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        padding: EdgeInsets.only(
          bottom: MediaQuery.viewInsetsOf(sheetContext).bottom,
        ),
        child: SafeArea(
          top: false,
          child: SingleChildScrollView(
            child: _ColumnFormSheet(initial: initial),
          ),
        ),
      ),
    );
  }

  @override
  State<_ColumnFormSheet> createState() => _ColumnFormSheetState();
}

class _ColumnFormSheetState extends State<_ColumnFormSheet> {
  late final TextEditingController _controller;
  late bool _isDoneColumn;

  bool get _isEditing => widget.initial != null;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initial?.nome ?? '');
    _isDoneColumn = widget.initial?.isDoneColumn ?? false;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    final name = _controller.text.trim();
    if (name.isEmpty) return;
    Navigator.pop(
      context,
      _ColumnFormResult(name: name, isDoneColumn: _isDoneColumn),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.fromLTRB(12, 0, 12, 24),
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Container(
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: cs.outlineVariant,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            _isEditing ? 'Renomear coluna' : 'Nova coluna',
            style: tt.titleMedium?.copyWith(
              color: cs.onSurface,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _controller,
            autofocus: true,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              filled: true,
              fillColor: cs.surfaceContainer,
              hintText: 'Nome da coluna',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
            onSubmitted: (_) => _submit(),
          ),
          if (!_isEditing) ...[
            const SizedBox(height: 12),
            CheckboxListTile(
              value: _isDoneColumn,
              onChanged: (value) =>
                  setState(() => _isDoneColumn = value ?? false),
              dense: true,
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(
                'Coluna de concluido',
                style: tt.bodyMedium?.copyWith(color: cs.onSurface),
              ),
            ),
          ],
          const SizedBox(height: 20),
          AppPrimaryButton(
            label: _isEditing ? 'Salvar' : 'Criar coluna',
            onPressed: _submit,
          ),
        ],
      ),
    );
  }
}
