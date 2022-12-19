import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product/domain/usecases/checkout.dart';
import 'package:product/domain/usecases/get_product_categories.dart';
import 'package:product/domain/usecases/get_products.dart';
import 'package:product/domain/usecases/get_transactions.dart';
import 'package:product/product.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProducts getProducts;
  final GetProductCategories getProductCategories;
  final GetTransactions getTransactions;
  final Checkout checkout;

  ProductBloc(
    this.getProducts,
    this.getProductCategories,
    this.getTransactions,
    this.checkout,
  ) : super(ProductInitial()) {
    on<OnFetchProduct>((event, emit) async {
      emit(ProductLoading());

      final result = await getProducts.execute();

      result.fold(
        (failure) => emit(ProductError(failure.message)),
        (result) => emit(ProductSuccess(result)),
      );
    });
    on<OnFetchCategories>((event, emit) async {
      emit(ProductLoading());

      final result = await getProductCategories.execute();

      result.fold(
        (failure) => emit(ProductError(failure.message)),
        (result) => emit(CategorySuccess(result)),
      );
    });
  }
}
