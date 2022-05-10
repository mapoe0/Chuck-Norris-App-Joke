import 'package:equatable/equatable.dart';

class JokeRequest extends Equatable {
  final String category;

  const JokeRequest(
    this.category,
  );
  @override
  // TODO: implement props
  List<Object> get props => [category];

  // for using the http dio package
  Map<String, dynamic> toMap() {
    final queryParameters = {
      'category': category,
    };
    return queryParameters;
  }
}
