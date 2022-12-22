import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product/domain/entities/category.dart';
import 'package:product/domain/usecases/get_categories.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GetCategories getCategories;

  CategoryBloc(this.getCategories) : super(CategoryInitial()) {
    on<OnFetchCategories>((event, emit) async {
      emit(CategoryLoading());

      final result = await getCategories.execute();

      result.fold(
        (failure) => emit(CategoryError(failure.message)),
        (result) => emit(CategorySuccess(result)),
      );
    });
  }
}
