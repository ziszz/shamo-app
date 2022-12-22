part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {}

class CategoryInitial extends CategoryState {
  @override
  List<Object?> get props => [];
}

class CategoryLoading extends CategoryState {
  @override
  List<Object?> get props => [];
}

class CategoryListSuccess extends CategoryState {
  final List<Category> categories;

  CategoryListSuccess(this.categories);

  @override
  List<Object?> get props => [categories];
}

class CategoryError extends CategoryState {
  final String message;

  CategoryError(this.message);

  @override
  List<Object?> get props => [message];
}
