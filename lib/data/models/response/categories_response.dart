import 'package:clean_architecture_2/domain/entities/categories.dart';
import 'package:equatable/equatable.dart';

class CategoriesResponse extends Equatable {
  String title;
  bool isClicked;
  CategoriesResponse({
    required this.title,
    required this.isClicked,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [title, isClicked];

  Categories toEntity() {
    return Categories(title: title, isClicked: isClicked);
  }

  factory CategoriesResponse.fromString(String title) {
    return CategoriesResponse(title: title, isClicked: false);
  }
}
