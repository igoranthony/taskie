import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskie/core/errors/app_error_parser.dart';
import '../../domain/entities/category.dart';
import '../../domain/usecases/create_category.dart';
import '../../domain/usecases/delete_category.dart';
import '../../domain/usecases/get_categories.dart';
import '../../domain/usecases/update_category.dart';
import 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final GetCategories _get;
  final CreateCategory _create;
  final UpdateCategory _update;
  final DeleteCategory _delete;

  CategoriesCubit({
    required GetCategories getCategories,
    required CreateCategory createCategory,
    required UpdateCategory updateCategory,
    required DeleteCategory deleteCategory,
  })  : _get = getCategories,
        _create = createCategory,
        _update = updateCategory,
        _delete = deleteCategory,
        super(const CategoriesState.initial());

  Future<void> load() async {
    emit(const CategoriesState.loading());
    try {
      final items = await _get();
      emit(CategoriesState.loaded(items));
    } catch (e) {
      emit(CategoriesState.failure(AppErrorParser.parse(e)));
    }
  }

  Future<Category?> create(String nome) async {
    final current = state is CategoriesLoaded ? state as CategoriesLoaded : null;
    if (current == null) return null;
    try {
      final created = await _create(nome);
      emit(CategoriesState.loaded([...current.categories, created]));
      return created;
    } catch (e) {
      emit(CategoriesState.failure(AppErrorParser.parse(e)));
      emit(current);
      return null;
    }
  }

  Future<void> update(String id, String nome) async {
    final current = state is CategoriesLoaded ? state as CategoriesLoaded : null;
    if (current == null) return;
    try {
      final updated = await _update(id, nome);
      emit(CategoriesState.loaded(
        current.categories.map((c) => c.id == id ? updated : c).toList(),
      ));
    } catch (e) {
      emit(CategoriesState.failure(AppErrorParser.parse(e)));
      emit(current);
    }
  }

  Future<bool> delete(String id) async {
    final current = state is CategoriesLoaded ? state as CategoriesLoaded : null;
    if (current == null) return false;
    try {
      await _delete(id);
      emit(CategoriesState.loaded(
        current.categories.where((c) => c.id != id).toList(),
      ));
      return true;
    } catch (e) {
      emit(CategoriesState.failure(AppErrorParser.parse(e)));
      emit(current);
      return false;
    }
  }
}
