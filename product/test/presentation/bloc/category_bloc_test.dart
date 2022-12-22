import 'package:bloc_test/bloc_test.dart';
import 'package:core/utilities/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:product/presentation/bloc/category/category_bloc.dart';

import '../../dummy_data/dummy_object.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late CategoryBloc bloc;
  late MockGetCategories mockGetCategories;
  late MockGetCategoryById mockGetCategoryById;

  setUp(() {
    mockGetCategories = MockGetCategories();
    mockGetCategoryById = MockGetCategoryById();
    bloc = CategoryBloc(mockGetCategories, mockGetCategoryById);
  });

  test("initial state should be empty", () async {
    expect(bloc.state, CategoryInitial());
  });

  group("OnFetchCategories", () {
    blocTest<CategoryBloc, CategoryState>(
      "should execute get categories when function called",
      build: () {
        when(mockGetCategories.execute())
            .thenAnswer((_) async => const Right([testCategory]));
        return bloc;
      },
      act: (bloc) => bloc.add(OnFetchCategories()),
      verify: (bloc) => verify(bloc.getCategories.execute()),
    );

    blocTest<CategoryBloc, CategoryState>(
      "should emit [Loading, Success] when get data is successfuly",
      build: () {
        when(mockGetCategories.execute())
            .thenAnswer((_) async => const Right([testCategory]));
        return bloc;
      },
      act: (bloc) => bloc.add(OnFetchCategories()),
      expect: () => [
        CategoryLoading(),
        CategoryListSuccess(const [testCategory]),
      ],
    );

    blocTest<CategoryBloc, CategoryState>(
      "should emit [Loading, Error] when get data is successfuly",
      build: () {
        when(mockGetCategories.execute())
            .thenAnswer((_) async => const Left(ServerFailure("")));
        return bloc;
      },
      act: (bloc) => bloc.add(OnFetchCategories()),
      expect: () => [
        CategoryLoading(),
        CategoryError(""),
      ],
    );
  });

  group("OnGetCategoryById event", () {
    const testCategoryId = 1;

    blocTest<CategoryBloc, CategoryState>(
      "should execute get category by id when function is called",
      build: () {
        when(mockGetCategoryById.execute(testCategoryId))
            .thenAnswer((_) async => const Right(testCategory));
        return bloc;
      },
      act: (bloc) => bloc.add(OnGetCategoryById(testCategoryId)),
      verify: (bloc) => verify(bloc.getCategoryById.execute(testCategoryId)),
    );

    blocTest<CategoryBloc, CategoryState>(
      "should emit [Loading, Success] when get data is successfuly",
      build: () {
        when(mockGetCategoryById.execute(testCategoryId))
            .thenAnswer((_) async => const Right(testCategory));
        return bloc;
      },
      act: (bloc) => bloc.add(OnGetCategoryById(testCategoryId)),
      expect: () => [
        CategoryLoading(),
        CategorySuccess(testCategory),
      ],
    );

    blocTest<CategoryBloc, CategoryState>(
      "should emit [Loading, Error] when get data is successfuly",
      build: () {
        when(mockGetCategoryById.execute(testCategoryId))
            .thenAnswer((_) async => const Left(ServerFailure("")));
        return bloc;
      },
      act: (bloc) => bloc.add(OnGetCategoryById(testCategoryId)),
      expect: () => [
        CategoryLoading(),
        CategoryError(""),
      ],
    );
  });
}
