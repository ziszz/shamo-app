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
  late MockUserRegister mockUserRegister;

  setUp(() {
    mockUserRegister = MockUserRegister();
    mockUserLogin = MockUserLogin();
    bloc = AuthBloc(
      userLogin: mockUserLogin,
      userRegister: mockUserRegister,
    );
  });

  const testName = "Zis";
  const testEmail = "abdaziz1181@gmail.com";
  const testPass = "12345678";
  const testUsername = "abdaziz1181";

  test("initial state should be empty", () async {
    // assert
    expect(bloc.state, AuthInitial());
  });

  group("OnLogin Event", () {
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
      "should emit [Loading, Loaded] when post data successfuly",
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
      "should emit [Loading, Error] when post data failed",
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

  group("On Register Event", () {
    blocTest<AuthBloc, AuthState>(
      "should execute user register when function called",
      build: () {
        when(mockUserRegister.execute(
                testName, testEmail, testUsername, testPass))
            .thenAnswer((_) async => const Right(testUser));
        return bloc;
      },
      act: (bloc) => bloc.add(const OnRegister(
        name: testName,
        email: testEmail,
        username: testUsername,
        password: testPass,
      )),
      verify: (bloc) => verify(
        bloc.userRegister.execute(testName, testEmail, testUsername, testPass),
      ),
    );

    blocTest<AuthBloc, AuthState>(
      'should emit [Loading, Success] when post data successfuly',
      build: () {
        when(mockUserRegister.execute(
                testName, testEmail, testUsername, testPass))
            .thenAnswer((_) async => const Right(testUser));
        return bloc;
      },
      act: (bloc) => bloc.add(const OnRegister(
        name: testName,
        email: testEmail,
        username: testUsername,
        password: testPass,
      )),
      expect: () => [
        AuthLoading(),
        const AuthSuccess(user: testUser),
      ],
    );

    blocTest<AuthBloc, AuthState>(
      'should emit [Loading, Error] when post data successfuly',
      build: () {
        when(mockUserRegister.execute(
                testName, testEmail, testUsername, testPass))
            .thenAnswer((_) async => const Left(ServerFailure("")));
        return bloc;
      },
      act: (bloc) => bloc.add(const OnRegister(
        name: testName,
        email: testEmail,
        username: testUsername,
        password: testPass,
      )),
      expect: () => [
        AuthLoading(),
        const AuthError(message: ""),
      ],
    );
  });
}
