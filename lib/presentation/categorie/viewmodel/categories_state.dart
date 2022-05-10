import 'package:equatable/equatable.dart';

enum CategoriesStatus {
  uncliked,
  clicked,
}

class CategoriesState extends Equatable {
  CategoriesStatus status;
  late String categories;

  CategoriesState({required this.status, required this.categories});
  factory CategoriesState.initial() {
    return CategoriesState(status: CategoriesStatus.uncliked, categories: '');
  }
  CategoriesState copyWith({CategoriesStatus? status}) {
    return CategoriesState(
        status: status ?? CategoriesStatus.clicked, categories: categories);
  }

  bool get isCliked {
    return status == CategoriesStatus.clicked;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status, categories];
}
