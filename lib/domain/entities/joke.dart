import 'package:equatable/equatable.dart';

class Joke extends Equatable {
  final String categorie;
  final String createDate;
  final String lastUpdate;
  final String text;
  final String onlineUrl;
  const Joke({
    required this.categorie,
    required this.createDate,
    required this.lastUpdate,
    required this.text,
    required this.onlineUrl,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [createDate, lastUpdate, text];
}
