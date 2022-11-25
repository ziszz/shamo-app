import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shamo_app/presentation/bloc/auth/auth_bloc.dart';
import 'package:shamo_app/presentation/pages/login_page.dart';
import 'package:shamo_app/presentation/pages/main_page.dart';

import '../../dummy_data/dummy_object.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockAuthBloc mockAuthBloc;

  setUp(() {
    mockAuthBloc = MockAuthBloc();
  });

  Widget makeTestableWidget(Widget body) {
    return BlocProvider<AuthBloc>.value(
      value: mockAuthBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  const testEmail = "abdaziz1181@gmail.com";
  const testPass = "12345678";

  group("Login Page", () {
    testWidgets("should display progress bar when loading", (tester) async {
      // arrange
      when(mockAuthBloc.stream).thenAnswer((_) => Stream.value(AuthLoading()));
      when(mockAuthBloc.state).thenReturn(AuthLoading());
      // act
      final progressBar = find.byKey(const Key("progress_bar"));
      await tester.pumpWidget(makeTestableWidget(const LoginPage()));
      // assert
      expect(progressBar, findsOneWidget);
    });

    testWidgets("should display Main Page when login success", (tester) async {
      // arrange
      when(mockAuthBloc.stream)
          .thenAnswer((_) => Stream.value(const AuthSuccess(user: testUser)));
      when(mockAuthBloc.state).thenReturn(const AuthSuccess(user: testUser));
      //act
      final emailInput = find.byKey(const Key("email_input"));
      final passInput = find.byKey(const Key("pass_input"));
      final loginBtn = find.byKey(const Key("login_btn"));
      final mainPage = find.byType(MainPage);

      await tester.pumpWidget(makeTestableWidget(const LoginPage()));
      await tester.enterText(emailInput, testEmail);
      await tester.enterText(passInput, testPass);
      await tester.tap(loginBtn);
      await tester.pumpAndSettle();

      // assert
      expect(mainPage, findsOneWidget);
    });
  });
}
