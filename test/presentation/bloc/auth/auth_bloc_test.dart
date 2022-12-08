import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shamo_app/presentation/bloc/auth/auth_bloc.dart';
import 'package:shamo_app/utilities/constants.dart';
import 'package:shamo_app/utilities/failure.dart';

import '../../../dummy_data/dummy_object.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late AuthBloc bloc;
  late MockUserLogin mockUserLogin;
  late MockUserRegister mockUserRegister;
  late MockUserLogout mockUserLogout;
  late MockGetUser mockGetUser;
  late MockUpdateProfile mockUpdateProfile;

  setUp(() {
    mockUserRegister = MockUserRegister();
    mockUserLogin = MockUserLogin();
    mockUserLogout = MockUserLogout();
    mockGetUser = MockGetUser();
    mockUpdateProfile = MockUpdateProfile();
    bloc = AuthBloc(
      userLogin: mockUserLogin,
      userRegister: mockUserRegister,
      userLogout: mockUserLogout,
      getUser: mockGetUser,
      updateProfile: mockUpdateProfile,
    );
  });

  const testToken = "access_token";
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

  group("OnLogout Event", () {
    blocTest<AuthBloc, AuthState>(
      "should execute user logout when function called",
      build: () {
        when(mockUserLogout.execute(testToken))
            .thenAnswer((_) async => const Right(true));
        return bloc;
      },
      act: (bloc) => bloc.add(const OnLogout(token: testToken)),
      verify: (bloc) => verify(bloc.userLogout.execute(testToken)),
    );

    blocTest<AuthBloc, AuthState>(
      "should emit [Loading, Success] when post data successfuly",
      build: () {
        when(mockUserLogout.execute(testToken))
            .thenAnswer((_) async => const Right(true));
        return bloc;
      },
      act: (bloc) => bloc.add(const OnLogout(token: testToken)),
      expect: () => [
        AuthLoading(),
        const AuthLogoutSuccess(isLogout: true),
      ],
    );

    blocTest<AuthBloc, AuthState>(
      "should emit [Loading, Error] when post data successfuly",
      build: () {
        when(mockUserLogout.execute(testToken)).thenAnswer((_) async =>
            const Left(ServerFailure(Constants.unauthenticatedMessage)));
        return bloc;
      },
      act: (bloc) => bloc.add(const OnLogout(token: testToken)),
      expect: () => [
        AuthLoading(),
        const AuthError(message: Constants.unauthenticatedMessage),
      ],
    );
  });

  group("Get User Event", () {
    blocTest<AuthBloc, AuthState>(
      "should execute get user when function called",
      build: () {
        when(mockGetUser.execute(testToken))
            .thenAnswer((_) async => const Right(testUser));
        return bloc;
      },
      act: (bloc) => bloc.add(const OnFetchUser(token: testToken)),
      verify: (bloc) => verify(bloc.getUser.execute(testToken)),
    );

    blocTest<AuthBloc, AuthState>(
      "should [Loading, Success] when gotten data successfuly",
      build: () {
        when(mockGetUser.execute(testToken))
            .thenAnswer((_) async => const Right(testUser));
        return bloc;
      },
      act: (bloc) => bloc.add(const OnFetchUser(token: testToken)),
      expect: () => [
        AuthLoading(),
        const AuthSuccess(user: testUser),
      ],
    );

    blocTest<AuthBloc, AuthState>(
      "should [Loading, Error] when gotten data failed",
      build: () {
        when(mockGetUser.execute(testToken))
            .thenAnswer((_) async => const Left(ServerFailure("")));
        return bloc;
      },
      act: (bloc) => bloc.add(const OnFetchUser(token: testToken)),
      expect: () => [
        AuthLoading(),
        const AuthError(message: ""),
      ],
    );
  });

  group("OnUpdate Event", () {
    blocTest<AuthBloc, AuthState>(
      "should execute update profile when function called",
      build: () {
        when(mockUpdateProfile.execute(
                testToken, testName, testEmail, testUsername))
            .thenAnswer((_) async => const Right(testUser));
        return bloc;
      },
      act: (bloc) => bloc.add(const OnUpdate(
        token: testToken,
        name: testName,
        email: testEmail,
        username: testUsername,
      )),
      verify: (bloc) => verify(bloc.updateProfile.execute(
        testToken,
        testName,
        testEmail,
        testUsername,
      )),
    );

    blocTest<AuthBloc, AuthState>(
      "should emit [Loading, Success] when data gotten successfuly",
      build: () {
        when(mockUpdateProfile.execute(
                testToken, testName, testEmail, testUsername))
            .thenAnswer((_) async => const Right(testUser));
        return bloc;
      },
      act: (bloc) => bloc.add(const OnUpdate(
        token: testToken,
        name: testName,
        email: testEmail,
        username: testUsername,
      )),
      expect: () => [
        AuthLoading(),
        const AuthSuccess(user: testUser),
      ],
    );

    blocTest<AuthBloc, AuthState>(
      "should emit [Loading, Error] when data gotten successfuly",
      build: () {
        when(mockUpdateProfile.execute(
                testToken, testName, testEmail, testUsername))
            .thenAnswer((_) async => const Left(ServerFailure("")));
        return bloc;
      },
      act: (bloc) => bloc.add(const OnUpdate(
        token: testToken,
        name: testName,
        email: testEmail,
        username: testUsername,
      )),
      expect: () => [
        AuthLoading(),
        const AuthError(message: ""),
      ],
    );
  });
}
