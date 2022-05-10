import 'package:clean_architecture_2/data/repository/joke_repository_impl.dart';
import 'package:clean_architecture_2/domain/repository/joke_repository.dart';
import 'package:clean_architecture_2/domain/usecase/categories_use_case.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../entities/joke.dart';

final jokeUseCaseProvider = Provider<JokeUseCase>(
    ((ref) => JokeUseCase(ref.read(jokeRopositoryProvider))));

class JokeUseCase {
  final JokeRepository _repository;

  JokeUseCase(this._repository);
  Future<Joke> getJoke(String categories) {
    return _repository.getJoke(categories: categories);
  }
}
