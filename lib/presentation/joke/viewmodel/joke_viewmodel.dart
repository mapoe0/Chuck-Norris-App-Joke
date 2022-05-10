import 'package:clean_architecture_2/domain/usecase/categories_use_case.dart';
import 'package:clean_architecture_2/domain/usecase/joke_use_case.dart';
import 'package:clean_architecture_2/presentation/categorie/viewmodel/categories_viewmodel.dart';
import 'package:clean_architecture_2/presentation/joke/screens/joke_view.dart';
import 'package:clean_architecture_2/presentation/joke/viewmodel/joke_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/entities/joke.dart';
/*
final jokeViewModelProvider =
    StateNotifierProviderFamily<JokeViewModel, JokeState, String>(
        ((ref, arg) => JokeViewModel(ref.read(jokeUseCaseProvider), arg)));

final jokeProvider = FutureProvider.family<Joke, String>(
  (ref, arg) => ref.watch(jokeViewModelProvider.call('argument').notifier).getJoke(arg),
);
*/

final jokeViewModelProvider =
    StateNotifierProvider.autoDispose<JokeViewModel, JokeState>(
        (ref) => JokeViewModel(ref.read(jokeUseCaseProvider), ""));

final jokeProvider = FutureProvider.autoDispose.family<Joke, String>(
    ((ref, arg) => ref.watch(jokeViewModelProvider.notifier).getJoke(arg)));
/*
final jokeViewModelProvider =
    StateNotifierProvider.autoDispose<JokeViewModel, JokeState>((ref) => 
        JokeViewModel(ref.read(jokeUseCaseProvider),""));

final jokeProvider = FutureProvider.autoDispose<Joke>(
    ((ref) => ref.watch(jokeViewModelProvider.notifier).getJoke("sport")));

    */

class JokeViewModel extends StateNotifier<JokeState> {
  JokeViewModel(this._useCase, this.categories) : super(JokeState.initial());
  JokeUseCase _useCase;
  String categories;
  void reset() {
    state = JokeState.initial();
  }

  void nextJoke() {}
  Future<Joke> getJoke(String categories) async {
    Joke joke = await _useCase.getJoke(categories);
    print(joke);
    return joke;
  }
}
