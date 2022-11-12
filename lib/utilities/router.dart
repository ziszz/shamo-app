import 'package:flutter/cupertino.dart';
import 'package:shamo_app/presentation/pages/empty_page.dart';
import 'package:shamo_app/presentation/pages/login_page.dart';
import 'package:shamo_app/presentation/pages/main_page.dart';
import 'package:shamo_app/presentation/pages/sign_up_page.dart';
import 'package:shamo_app/presentation/pages/splash_screen.dart';

Route _createRoute({required Widget page}) {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 600),
    reverseTransitionDuration: const Duration(milliseconds: 700),
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1, 0);
      const end = Offset.zero;
      const curve = Curves.easeIn;

      final tween = Tween(begin: begin, end: end);
      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: curve,
      );

      return SlideTransition(
        position: tween.animate(curvedAnimation),
        child: child,
      );
    },
  );
}

RouteFactory? router = (settings) {
  switch (settings.name) {
    case SplashScreen.routeName:
      return _createRoute(page: const SplashScreen());
    case LoginPage.routeName:
      return _createRoute(page: const LoginPage());
    case SignUpPage.routeName:
      return _createRoute(page: const SignUpPage());
    case MainPage.routeName:
      return _createRoute(page: const MainPage());
    default:
      return _createRoute(page: const EmptyPage());
  }
};
