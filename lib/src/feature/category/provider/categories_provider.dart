import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stamp/src/feature/category/data/category_repository.dart';
import 'package:stamp/src/feature/category/model/category_response.dart';

final categoriesProvider = FutureProvider<List<CategoryResponse>>((ref) async {
  final repository = ref.watch(categoryRepositoryProvider);
  return repository.categories();
});
