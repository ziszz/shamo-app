import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shamo_app/presentation/cubit/page_cubit.dart';

void main() {
  late PageCubit cubit;

  setUp(() {
    cubit = PageCubit();
  });

  group("Page Cubit", () {
    const testNewIndex = 1;
    test("should index 0 when initial", () async {
      expect(cubit.state, 0);
    });

    blocTest<PageCubit, int>(
      "should change to new index when emit successfuly",
      build: () => cubit,
      act: (cubit) => cubit.setPage(testNewIndex),
      expect: () => [testNewIndex],
    );
  });
}
