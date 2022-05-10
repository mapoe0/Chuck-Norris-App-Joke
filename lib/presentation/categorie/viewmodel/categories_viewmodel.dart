import 'package:clean_architecture_2/domain/entities/categories.dart';
import 'package:clean_architecture_2/domain/usecase/categories_use_case.dart';
import 'package:clean_architecture_2/presentation/categorie/viewmodel/categories_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final categoriesViewModelProvider =
    StateNotifierProvider<CategoriesViewModel, CategoriesState>(
        (ref) => CategoriesViewModel(ref.read(categoriesUseCaseProvider)));

final categoriesProvider = FutureProvider.autoDispose<List<Categories>>(
    (ref) => ref.watch(categoriesViewModelProvider.notifier).getCategories());

class CategoriesViewModel extends StateNotifier<CategoriesState> {
  final CategoriesUseCase _useCase;

  CategoriesViewModel(this._useCase) : super(CategoriesState.initial());
  Future<List<Categories>> getCategories() {
    return _useCase.getCategories();
  }
}
