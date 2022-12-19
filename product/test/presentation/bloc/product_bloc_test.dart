import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:product/presentation/bloc/product_bloc.dart';

import '../../dummy_data/dummy_object.dart';
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

  group("OnFetchProducts Event", () {
    blocTest<ProductBloc, ProductState>(
      "should execute get products when function is called",
      build: () {
        when(mockGetProducts.execute())
            .thenAnswer((_) async => const Right([testProduct]));
        return bloc;
      },
      act: (bloc) => bloc.add(OnFetchProduct()),
      verify: (bloc) => verify(bloc.getProducts.execute()),
    );

    blocTest<ProductBloc, ProductState>(
      "should emit [Loading, Success] when get data is successfuly",
      build: () {
        when(mockGetProducts.execute())
            .thenAnswer((_) async => const Right([testProduct]));
        return bloc;
      },
      act: (bloc) => bloc.add(OnFetchProduct()),
      expect: () => [
        ProductLoading(),
        ProductSuccess(const [testProduct]),
      ],
    );

    blocTest<ProductBloc, ProductState>(
      "should emit [Loading, Error] when get data is failed",
      build: () {
        when(mockGetProducts.execute())
            .thenAnswer((_) async => const Left(ServerFailure("")));
        return bloc;
      },
      act: (bloc) => bloc.add(OnFetchProduct()),
      expect: () => [
        ProductLoading(),
        ProductError(""),
      ],
    );
  });
}
