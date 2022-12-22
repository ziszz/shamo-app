part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {}

class OnFetchCategories extends CategoryEvent {
  @override
  List<Object?> get props => [];
}

class OnGetCategoryById extends CategoryEvent {
  final int categoryId;

  OnGetCategoryById(this.categoryId);

  @override
  List<Object?> get props => [categoryId];
}
