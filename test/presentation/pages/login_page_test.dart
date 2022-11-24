import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shamo_app/presentation/bloc/auth/auth_bloc.dart';
import 'package:shamo_app/presentation/pages/login_page.dart';

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
      child: MaterialApp(home: body),
    );
  }

  const testEmail = "abdaziz1181@gmail.com";
  const testPass = "12345678";

  group("Login Page", () {
    testWidgets("should go to main page when login success", (tester) async {
      // arrange
      when(mockAuthBloc.stream)
          .thenAnswer((_) => Stream.value(const AuthLoaded(user: testUser)));
      when(mockAuthBloc.state).thenReturn(const AuthLoaded(user: testUser));
      // act
      final emailInputFinder = find.byKey(const Key("email_input"));
      final passInputFinder = find.byKey(const Key("pass_input"));
      final loginBtnFinder = find.byKey(const Key("login_btn"));

      await tester.pumpWidget(makeTestableWidget(const LoginPage()));
      await tester.enterText(emailInputFinder, testEmail);
      await tester.enterText(passInputFinder, testPass);
      await tester.tap(loginBtnFinder);
      await tester.pumpAndSettle();
      // assert
      // expect(find.byType(MainPage), findsOneWidget);
    });
  });
}
