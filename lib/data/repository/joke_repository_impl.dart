import 'package:clean_architecture_2/data/api/api.dart';
import 'package:clean_architecture_2/domain/entities/joke.dart';
import 'package:clean_architecture_2/domain/repository/joke_repository.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/request/joke_request.dart';

final jokeRopositoryProvider = Provider<JokeRepository>(
  (ref) => JokeRepositoryImpl(ref.read(remoteApiProvider)),
);

class JokeRepositoryImpl extends JokeRepository {
  final RemoteApi _api;

  JokeRepositoryImpl(this._api);

  @override
  Future<Joke> getJoke({required String categories}) => _api
      .getRandomJoke(JokeRequest(categories))
      .then((value) => value!.toEntity());
}
