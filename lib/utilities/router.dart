import 'package:flutter/material.dart';
import 'package:shamo_app/presentation/pages/cart_page.dart';
import 'package:shamo_app/presentation/pages/checkout_page.dart';
import 'package:shamo_app/presentation/pages/empty_page.dart';
import 'package:shamo_app/presentation/pages/login_page.dart';
import 'package:shamo_app/presentation/pages/main_page.dart';
import 'package:shamo_app/presentation/pages/sign_up_page.dart';
import 'package:shamo_app/presentation/pages/splash_screen.dart';

import '../presentation/pages/chat_detail_page.dart';

enum SlideOption { slideX, slideY }

Route _createRoute({
  required Widget page,
  SlideOption slideOption = SlideOption.slideX,
}) {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 300),
    reverseTransitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final begin = slideOption == SlideOption.slideX
          ? const Offset(1, 0)
          : const Offset(0, 1);

      const end = Offset.zero;
      const curve = Curves.ease;

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
      return MaterialPageRoute(
        builder: (_) => const SplashScreen(),
      );
    case LoginPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const LoginPage(),
      );
    case SignUpPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const SignUpPage(),
      );
    case MainPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const MainPage(),
      );
    case ChatDetailPage.routeName:
      return _createRoute(
        page: const ChatDetailPage(),
      );
    case CartPage.routeName:
      return _createRoute(
        page: const CartPage(),
        slideOption: SlideOption.slideY,
      );
    case CheckoutPage.routeName:
      return _createRoute(
        page: const CheckoutPage(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => const EmptyPage(),
      );
  }
};
