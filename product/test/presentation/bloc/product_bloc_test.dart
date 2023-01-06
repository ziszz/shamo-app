import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:product/presentation/bloc/product/product_bloc.dart';

import '../../dummy_data/dummy_object.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late ProductBloc bloc;
  late MockGetProducts mockGetProducts;
  late MockGetProductsByCategory mockGetProductsByCategory;

  setUp(() {
    mockGetProducts = MockGetProducts();
    mockGetProductsByCategory = MockGetProductsByCategory();
    bloc = ProductBloc(
      mockGetProducts,
      mockGetProductsByCategory,
    );
  });

  test("initial state should be empty", () async {
    // assert
    expect(bloc.state, ProductInitial());
  });

  group("OnFetchProducts event", () {
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

  group("OnFetchProductByCategory event", () {
    const testCategoryId = 1;

    blocTest<ProductBloc, ProductState>(
      "should execute get products by category when function is called",
      build: () {
        when(mockGetProductsByCategory.execute(testCategoryId))
            .thenAnswer((_) async => const Right([testProduct]));
        return bloc;
      },
      act: (bloc) => bloc.add(OnFetchProductByCategory(testCategoryId)),
      verify: (bloc) =>
          verify(bloc.getProductsByCategory.execute(testCategoryId)),
    );

    blocTest<ProductBloc, ProductState>(
      "should emit [Loading, Success] when get data is successfuly",
      build: () {
        when(mockGetProductsByCategory.execute(testCategoryId))
            .thenAnswer((_) async => const Right([testProduct]));
        return bloc;
      },
      act: (bloc) => bloc.add(OnFetchProductByCategory(testCategoryId)),
      expect: () => [
        ProductLoading(),
        ProductByCategorySuccess(const [testProduct]),
      ],
    );

    blocTest<ProductBloc, ProductState>(
      "should emit [Loading, Error] when get data is failed",
      build: () {
        when(mockGetProductsByCategory.execute(testCategoryId))
            .thenAnswer((_) async => const Left(ServerFailure("")));
        return bloc;
      },
      act: (bloc) => bloc.add(OnFetchProductByCategory(testCategoryId)),
      expect: () => [
        ProductLoading(),
        ProductError(""),
      ],
    );
  });
}
