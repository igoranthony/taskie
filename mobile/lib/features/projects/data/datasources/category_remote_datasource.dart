import 'package:dio/dio.dart';
import '../../../../core/network/api_endpoints.dart';
import '../models/category_model.dart';

abstract class CategoryRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
  Future<CategoryModel> createCategory(String nome);
  Future<CategoryModel> updateCategory(String id, String nome);
  Future<void> deleteCategory(String id);
}

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final Dio dio;

  CategoryRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await dio.get(ApiEndpoints.categories);
    final List<dynamic> data = response.data is List
        ? response.data
        : response.data['results'] ?? response.data;
    return data.map((json) => CategoryModel.fromJson(json)).toList();
  }

  @override
  Future<CategoryModel> createCategory(String nome) async {
    final response = await dio.post(ApiEndpoints.categories, data: {'nome': nome});
    return CategoryModel.fromJson(response.data);
  }

  @override
  Future<CategoryModel> updateCategory(String id, String nome) async {
    final response = await dio.put(
      ApiEndpoints.categoryDetail(id),
      data: {'nome': nome},
    );
    return CategoryModel.fromJson(response.data);
  }

  @override
  Future<void> deleteCategory(String id) async {
    await dio.delete(ApiEndpoints.categoryDetail(id));
  }
}
