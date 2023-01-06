part of 'product_bloc.dart';

abstract class ProductState extends Equatable {}

class ProductInitial extends ProductState {
  @override
  List<Object?> get props => [];
}

class ProductLoading extends ProductState {
  @override
  List<Object?> get props => [];
}

class ProductSuccess extends ProductState {
  final List<Product> products;

  ProductSuccess(this.products);

  @override
  List<Object?> get props => [products];
}

class ProductByCategorySuccess extends ProductState {
  final List<Product> products;

  ProductByCategorySuccess(this.products);

  @override
  List<Object?> get props => [products];
}

class ProductError extends ProductState {
  final String message;

  ProductError(this.message);

  @override
  List<Object?> get props => [message];
}
