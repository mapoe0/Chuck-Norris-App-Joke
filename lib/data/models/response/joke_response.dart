import 'package:clean_architecture_2/domain/entities/joke.dart';
import 'package:equatable/equatable.dart';

class JokeResponse extends Equatable {
  final String categorie;
  final String createDate;
  final String lastUpdate;
  final String text;
  final String onlineUrl;
  const JokeResponse({
    required this.categorie,
    required this.createDate,
    required this.lastUpdate,
    required this.text,
    required this.onlineUrl,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [createDate, lastUpdate, text];

  // convert to entity
  Joke toEntity() {
    return Joke(
        categorie: categorie,
        createDate: createDate,
        lastUpdate: lastUpdate,
        text: text,
        onlineUrl: onlineUrl);
  }

  factory JokeResponse.fromMap(Map<String, dynamic> map, String categorie) {
    return JokeResponse(
        categorie: categorie,
        createDate: map['created_at'],
        lastUpdate: map['updated_at'],
        text: map['value'],
        onlineUrl: map['url']);
  }
}
