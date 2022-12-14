import 'package:auth/presentation/bloc/auth_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_object.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late AuthBloc bloc;
  late MockUserLogin mockUserLogin;
  late MockUserRegister mockUserRegister;
  late MockUserLogout mockUserLogout;
  late MockGetUser mockGetUser;
  late MockUpdateProfile mockUpdateProfile;
  late MockGetActiveUser mockGetActiveUser;

  setUp(() {
    mockUserRegister = MockUserRegister();
    mockUserLogin = MockUserLogin();
    mockUserLogout = MockUserLogout();
    mockGetUser = MockGetUser();
    mockUpdateProfile = MockUpdateProfile();
    mockGetActiveUser = MockGetActiveUser();
    bloc = AuthBloc(
      mockUserLogin,
      mockUserRegister,
      mockUserLogout,
      mockGetUser,
      mockUpdateProfile,
      mockGetActiveUser,
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
      act: (bloc) => bloc.add(OnLogin(
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
      act: (bloc) => bloc.add(OnLogin(
        email: testEmail,
        password: testPass,
      )),
      expect: () => [
        AuthLoading(),
        AuthSuccess(testUser),
      ],
    );

    blocTest<AuthBloc, AuthState>(
      "should emit [Loading, Error] when post data failed",
      build: () {
        when(mockUserLogin.execute(testEmail, testPass))
            .thenAnswer((_) async => const Left(ServerFailure("")));
        return bloc;
      },
      act: (bloc) => bloc.add(OnLogin(
        email: testEmail,
        password: testPass,
      )),
      expect: () => [
        AuthLoading(),
        AuthError(""),
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
      act: (bloc) => bloc.add(OnRegister(
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
      act: (bloc) => bloc.add(OnRegister(
        name: testName,
        email: testEmail,
        username: testUsername,
        password: testPass,
      )),
      expect: () => [
        AuthLoading(),
        AuthSuccess(testUser),
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
      act: (bloc) => bloc.add(OnRegister(
        name: testName,
        email: testEmail,
        username: testUsername,
        password: testPass,
      )),
      expect: () => [
        AuthLoading(),
        AuthError(""),
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
      act: (bloc) => bloc.add(OnLogout(token: testToken)),
      verify: (bloc) => verify(bloc.userLogout.execute(testToken)),
    );

    blocTest<AuthBloc, AuthState>(
      "should emit [Loading, Initial] when post data successfuly",
      build: () {
        when(mockUserLogout.execute(testToken))
            .thenAnswer((_) async => const Right(true));
        return bloc;
      },
      act: (bloc) => bloc.add(OnLogout(token: testToken)),
      expect: () => [
        AuthLoading(),
        AuthInitial(),
      ],
    );

    blocTest<AuthBloc, AuthState>(
      "should emit [Loading, Error] when post data successfuly",
      build: () {
        when(mockUserLogout.execute(testToken)).thenAnswer((_) async =>
            const Left(ServerFailure(Constants.unauthenticatedMessage)));
        return bloc;
      },
      act: (bloc) => bloc.add(OnLogout(token: testToken)),
      expect: () => [
        AuthLoading(),
        AuthError(Constants.unauthenticatedMessage),
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
      act: (bloc) => bloc.add(OnGetUser(token: testToken)),
      verify: (bloc) => verify(bloc.getUser.execute(testToken)),
    );

    blocTest<AuthBloc, AuthState>(
      "should [Loading, Success] when gotten data successfuly",
      build: () {
        when(mockGetUser.execute(testToken))
            .thenAnswer((_) async => const Right(testUser));
        return bloc;
      },
      act: (bloc) => bloc.add(OnGetUser(token: testToken)),
      expect: () => [
        AuthLoading(),
        AuthSuccess(testUser),
      ],
    );

    blocTest<AuthBloc, AuthState>(
      "should [Loading, Error] when gotten data failed",
      build: () {
        when(mockGetUser.execute(testToken))
            .thenAnswer((_) async => const Left(ServerFailure("")));
        return bloc;
      },
      act: (bloc) => bloc.add(OnGetUser(token: testToken)),
      expect: () => [
        AuthLoading(),
        AuthError(""),
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
      act: (bloc) => bloc.add(OnUpdate(
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
      act: (bloc) => bloc.add(OnUpdate(
        token: testToken,
        name: testName,
        email: testEmail,
        username: testUsername,
      )),
      expect: () => [
        AuthLoading(),
        AuthSuccess(testUser),
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
      act: (bloc) => bloc.add(OnUpdate(
        token: testToken,
        name: testName,
        email: testEmail,
        username: testUsername,
      )),
      expect: () => [
        AuthLoading(),
        AuthError(""),
      ],
    );
  });

  group("OnGetActiveUser Event", () {
    blocTest<AuthBloc, AuthState>(
      "should execute get active user when function called",
      build: () {
        when(mockGetActiveUser.execute())
            .thenAnswer((_) async => const Right(testUser));
        return bloc;
      },
      act: (bloc) => bloc.add(OnGetActiveUser()),
      verify: (bloc) => verify(bloc.getActiveUser.execute()),
    );

    blocTest<AuthBloc, AuthState>(
      "should emit [Success] when data gotten successfuly",
      build: () {
        when(mockGetActiveUser.execute())
            .thenAnswer((_) async => const Right(testUser));
        return bloc;
      },
      act: (bloc) => bloc.add(OnGetActiveUser()),
      expect: () => [
        AuthSuccess(testUser),
      ],
    );
  });
}
