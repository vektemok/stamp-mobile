import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stamp/src/core/provider/dio_provider.dart';
import 'package:stamp/src/feature/category/model/category_response.dart';

/// {@template category_repository}
/// CategoryRepository.
/// {@endtemplate}
abstract interface class CategoryRepository {
  /// {@macro category_repository}
  Future<List<CategoryResponse>> categories();
}

/// {@template category_repository}
/// CategoryRepositoryImpl.
/// {@endtemplate}
final class CategoryRepositoryImpl implements CategoryRepository {
  /// {@macro category_repository}
  CategoryRepositoryImpl({required Dio dio}) : _dio = dio;

  final Dio _dio;

  @override
  Future<List<CategoryResponse>> categories() async {
    final response = await _dio.get('/categories/');

    return (response.data as List)
        .map((e) => CategoryResponse.fromJson(e))
        .toList();
  }
}

final categoryRepositoryProvider = Provider<CategoryRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return CategoryRepositoryImpl(dio: dio);
});


