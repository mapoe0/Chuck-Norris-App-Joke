import 'package:clean_architecture_2/domain/entities/joke.dart';

abstract class JokeRepository {
  Future<Joke> getJoke({required String categories});
}
