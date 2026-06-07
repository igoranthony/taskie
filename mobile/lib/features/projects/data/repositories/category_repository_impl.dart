import '../../domain/entities/category.dart';
import '../../domain/repositories/category_repository.dart';
import '../datasources/category_remote_datasource.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDataSource remoteDataSource;

  CategoryRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Category>> getCategories() async {
    final models = await remoteDataSource.getCategories();
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<Category> createCategory(String nome) async {
    final model = await remoteDataSource.createCategory(nome);
    return model.toEntity();
  }

  @override
  Future<Category> updateCategory(String id, String nome) async {
    final model = await remoteDataSource.updateCategory(id, nome);
    return model.toEntity();
  }

  @override
  Future<void> deleteCategory(String id) async {
    await remoteDataSource.deleteCategory(id);
  }
}
