import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../shared/widgets/app_empty_state.dart';
import '../../../../shared/widgets/app_error_widget.dart';
import '../../../../shared/widgets/app_loading.dart';
import '../../../../shared/widgets/app_snackbar.dart';
import '../../../../shared/widgets/confirm_dialog.dart';
import '../../domain/entities/category.dart';
import '../../domain/usecases/create_category.dart';
import '../../domain/usecases/delete_category.dart';
import '../../domain/usecases/get_categories.dart';
import '../../domain/usecases/update_category.dart';
import '../cubit/categories_cubit.dart';
import '../cubit/categories_state.dart';

class CategoryManagePage extends StatelessWidget {
  const CategoryManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CategoriesCubit(
        getCategories: getIt<GetCategories>(),
        createCategory: getIt<CreateCategory>(),
        updateCategory: getIt<UpdateCategory>(),
        deleteCategory: getIt<DeleteCategory>(),
      )..load(),
      child: const _CategoryManageView(),
    );
  }
}

class _CategoryManageView extends StatelessWidget {
  const _CategoryManageView();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: cs.surface,
      body: SafeArea(
        child: Column(
          children: [
            const _Header(),
            const SizedBox(height: 16),
            const Expanded(child: _Content()),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

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
            child: Material(
              color: cs.surfaceContainer,
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                onTap: () => context.pop(),
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  width: 38,
                  height: 38,
                  child: Icon(Icons.arrow_back, size: 18, color: cs.onSurface),
                ),
              ),
            ),
          ),
          Text(
            'Categorias',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: cs.onSurface,
                  fontWeight: FontWeight.w600,
                ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Material(
              color: cs.surfaceContainer,
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                onTap: () => _showCategoryDialog(context),
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  width: 38,
                  height: 38,
                  child: Icon(Icons.add, size: 18, color: cs.onSurface),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) => state.when(
        initial: () => const Center(child: AppLoading()),
        loading: () => const Center(child: AppLoading()),
        loaded: (categories) {
          if (categories.isEmpty) {
            return const AppEmptyState(
              icon: Icons.label_outline,
              title: 'Nenhuma categoria',
              subtitle: 'Toque em + para criar uma categoria',
            );
          }
          return RefreshIndicator(
            onRefresh: () => context.read<CategoriesCubit>().load(),
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
              itemCount: categories.length,
              itemBuilder: (_, i) => _CategoryRow(category: categories[i]),
            ),
          );
        },
        failure: (message) => AppErrorWidget(
          error: message,
          message: 'Erro ao carregar categorias',
          onRetry: () => context.read<CategoriesCubit>().load(),
        ),
      ),
    );
  }
}

class _CategoryRow extends StatelessWidget {
  final Category category;

  const _CategoryRow({required this.category});

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
          onTap: () => _showCategoryDialog(context, initial: category),
          borderRadius: BorderRadius.circular(14),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 8, 14),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: cs.primaryContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.label_outline,
                    size: 16,
                    color: cs.onPrimaryContainer,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        category.nome,
                        style: tt.titleSmall?.copyWith(
                          color: cs.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '${category.totalProjetos} projeto(s)',
                        style: tt.bodySmall?.copyWith(
                          color: cs.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.delete_outline, size: 18, color: cs.error),
                  onPressed: () => _confirmDelete(context, category),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _confirmDelete(BuildContext context, Category category) async {
    final cubit = context.read<CategoriesCubit>();
    final confirmed = await ConfirmDialog.show(
      context,
      title: 'Excluir categoria',
      message: 'Excluir "${category.nome}"?',
      confirmLabel: 'Excluir',
      destructive: true,
    );
    if (!confirmed || !context.mounted) return;
    final ok = await cubit.delete(category.id);
    if (!ok && context.mounted) {
      AppSnackbar.error(
        context,
        'Não foi possível excluir — categoria com projetos vinculados.',
      );
    }
  }
}

Future<void> _showCategoryDialog(
  BuildContext context, {
  Category? initial,
}) async {
  final cubit = context.read<CategoriesCubit>();
  final controller = TextEditingController(text: initial?.nome ?? '');
  final isEditing = initial != null;
  final result = await showDialog<String>(
    context: context,
    builder: (dialogContext) {
      return AlertDialog(
        title: Text(isEditing ? 'Renomear categoria' : 'Nova categoria'),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: const InputDecoration(hintText: 'Nome'),
          textInputAction: TextInputAction.done,
          onSubmitted: (v) => Navigator.pop(dialogContext, v.trim()),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () =>
                Navigator.pop(dialogContext, controller.text.trim()),
            child: Text(isEditing ? 'Salvar' : 'Criar'),
          ),
        ],
      );
    },
  );
  controller.dispose();
  if (result == null || result.isEmpty) return;
  if (isEditing) {
    await cubit.update(initial.id, result);
  } else {
    await cubit.create(result);
  }
}
