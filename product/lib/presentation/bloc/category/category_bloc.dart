import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product/domain/entities/category.dart';
import 'package:product/domain/usecases/get_categories.dart';
import 'package:product/domain/usecases/get_category_by_id.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GetCategories getCategories;
  final GetCategoryById getCategoryById;

  CategoryBloc(this.getCategories, this.getCategoryById)
      : super(CategoryInitial()) {
    on<OnFetchCategories>((event, emit) async {
      emit(CategoryLoading());

      final result = await getCategories.execute();

      result.fold(
        (failure) => emit(CategoryError(failure.message)),
        (result) => emit(CategoryListSuccess(result)),
      );
    });
    on<OnGetCategoryById>((event, emit) async {
      emit(CategoryLoading());

      final categoryId = event.categoryId;

      final result = await getCategoryById.execute(categoryId);
      result.fold(
        (failure) => emit(CategoryError(failure.message)),
        (result) => emit(CategorySuccess(result)),
      );
    });
  }
}
