import 'package:clean_architecture_2/domain/entities/categories.dart';
import 'package:clean_architecture_2/domain/entities/joke.dart';

abstract class CategoriesRepository {
  Future<List<Categories>> getCategories();
}
