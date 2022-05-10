import 'package:equatable/equatable.dart';

class Categories extends Equatable {
  final String title;
  bool isClicked;
  Categories({
    required this.title,
    this.isClicked = false,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [title, isClicked];
}
