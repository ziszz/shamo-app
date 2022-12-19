import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:product/domain/usecases/checkout.dart';
import 'package:product/domain/usecases/get_product_categories.dart';
import 'package:product/domain/usecases/get_products.dart';
import 'package:product/domain/usecases/get_transactions.dart';

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
    on<ProductEvent>((event, emit) {});
  }
}
