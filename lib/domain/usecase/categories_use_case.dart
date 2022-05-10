import 'package:clean_architecture_2/data/repository/categorie_repository_impl.dart';
import 'package:clean_architecture_2/domain/entities/categories.dart';
import 'package:clean_architecture_2/domain/repository/categories_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final categoriesUseCaseProvider = Provider<CategoriesUseCase>(
    ((ref) => CategoriesUseCase(ref.read(categoriesRepositoryProvider))));

class CategoriesUseCase {
  final CategoriesRepository _repository;

  CategoriesUseCase(this._repository);
  Future<List<Categories>> getCategories() {
    return _repository.getCategories();
  }
}
