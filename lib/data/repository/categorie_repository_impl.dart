import 'package:clean_architecture_2/data/api/api.dart';
import 'package:clean_architecture_2/domain/entities/categories.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/repository/categories_repository.dart';

final categoriesRepositoryProvider = Provider<CategoriesRepository>(
  (ref) => CategoriesRepositoryImpl(ref.read(remoteApiProvider)),
);

class CategoriesRepositoryImpl extends CategoriesRepository {
  final RemoteApi _api;

  CategoriesRepositoryImpl(this._api);

  @override
  Future<List<Categories>> getCategories() =>
      _api.getCategories().then(((value) => value));
}
