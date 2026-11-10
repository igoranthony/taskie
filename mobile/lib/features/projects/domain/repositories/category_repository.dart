import '../entities/category.dart';

abstract class CategoryRepository {
  Future<List<Category>> getCategories();
  Future<Category> createCategory(String nome);
  Future<Category> updateCategory(String id, String nome);
  Future<void> deleteCategory(String id);
}
