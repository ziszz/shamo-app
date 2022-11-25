import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shamo_app/presentation/bloc/auth/auth_bloc.dart';
import 'package:shamo_app/utilities/failure.dart';

import '../../../dummy_data/dummy_object.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late AuthBloc bloc;
  late MockUserLogin mockUserLogin;

  setUp(() {
    mockUserLogin = MockUserLogin();
    bloc = AuthBloc(
      userLogin: mockUserLogin,
    );
  });

  const testEmail = "abdaziz1181@gmail.com";
  const testPass = "12345678";

  group("OnLogin Event", () {
    test("initial state should be empty", () async {
      // assert
      expect(bloc.state, AuthInitial());
    });

    blocTest<AuthBloc, AuthState>(
      "should execute user login when function called",
      build: () {
        when(mockUserLogin.execute(testEmail, testPass))
            .thenAnswer((_) async => const Right(testUser));
        return bloc;
      },
      act: (bloc) => bloc.add(const OnLogin(
        email: testEmail,
        password: testPass,
      )),
      verify: (bloc) => verify(bloc.userLogin.execute(testEmail, testPass)),
    );

    blocTest<AuthBloc, AuthState>(
      "should emit [Loading, Loaded] when data gotten successfully",
      build: () {
        when(mockUserLogin.execute(testEmail, testPass))
            .thenAnswer((_) async => const Right(testUser));
        return bloc;
      },
      act: (bloc) => bloc.add(const OnLogin(
        email: testEmail,
        password: testPass,
      )),
      expect: () => [
        AuthLoading(),
        const AuthSuccess(user: testUser),
      ],
    );

    blocTest<AuthBloc, AuthState>(
      "should emit [Loading, Error] when data gotten failed",
      build: () {
        when(mockUserLogin.execute(testEmail, testPass))
            .thenAnswer((_) async => const Left(ServerFailure("")));
        return bloc;
      },
      act: (bloc) => bloc.add(const OnLogin(
        email: testEmail,
        password: testPass,
      )),
      expect: () => [
        AuthLoading(),
        const AuthError(message: ""),
      ],
    );
  });
}
