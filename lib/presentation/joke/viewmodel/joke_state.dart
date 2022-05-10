import 'package:equatable/equatable.dart';

enum JokeStatus { init, done }

class JokeState extends Equatable {
  final JokeStatus status;

  const JokeState({
    required this.status,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [status];

  factory JokeState.initial() {
    return const JokeState(status: JokeStatus.init);
  }
  JokeState copyWith({JokeStatus? status}) {
    return JokeState(status: status ?? this.status);
  }
}
