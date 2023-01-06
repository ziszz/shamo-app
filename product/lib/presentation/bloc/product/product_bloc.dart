import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product/domain/usecases/get_products.dart';
import 'package:product/domain/usecases/get_products_by_category.dart';
import 'package:product/product.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProducts getProducts;
  final GetProductsByCategory getProductsByCategory;

  ProductBloc(this.getProducts, this.getProductsByCategory)
      : super(ProductInitial()) {
    on<OnFetchProduct>((event, emit) async {
      emit(ProductLoading());

      final result = await getProducts.execute();

      result.fold(
        (failure) => emit(ProductError(failure.message)),
        (result) => emit(ProductSuccess(result)),
      );
    });
    on<OnFetchProductByCategory>((event, emit) async {
      emit(ProductLoading());

      final categoryId = event.categoryId;

      final result = await getProductsByCategory.execute(categoryId);
      result.fold(
        (failure) => emit(ProductError(failure.message)),
        (result) => emit(ProductByCategorySuccess(result)),
      );
    });
  }
}
