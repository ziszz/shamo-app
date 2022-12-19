import 'package:flutter_test/flutter_test.dart';
import 'package:product/presentation/bloc/product_bloc.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late ProductBloc bloc;
  late MockGetProducts mockGetProducts;
  late MockGetProductCategories mockGetProductCategories;
  late MockGetTransactions mockGetTransactions;
  late MockCheckout mockCheckout;

  setUp(() {
    mockGetProducts = MockGetProducts();
    mockGetProductCategories = MockGetProductCategories();
    mockGetTransactions = MockGetTransactions();
    mockCheckout = MockCheckout();
    bloc = ProductBloc(
      mockGetProducts,
      mockGetProductCategories,
      mockGetTransactions,
      mockCheckout,
    );
  });

  test("initial state should be empty", () async {
    // assert
    expect(bloc.state, ProductInitial());
  });
}
