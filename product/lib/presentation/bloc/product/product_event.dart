part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {}

class OnFetchProduct extends ProductEvent {
  OnFetchProduct();

  @override
  List<Object?> get props => [];
}