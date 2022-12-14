import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:product/product.dart';

enum SlideOption { slideX, slideY }

Route _createRoute({
  required Widget page,
  RouteSettings? settings,
  SlideOption slideOption = SlideOption.slideX,
}) {
  return PageRouteBuilder(
    settings: settings,
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
        settings: settings,
        builder: (_) => MainPage(
          token: settings.arguments as String,
        ),
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
    case CheckoutSuccessPage.routeName:
      return _createRoute(
        page: const CheckoutSuccessPage(),
      );
    case EditProfilePage.routeName:
      return _createRoute(
        settings: settings,
        page: EditProfilePage(
          user: settings.arguments as User,
        ),
      );
    case ProductDetailPage.routeName:
      return _createRoute(
        page: const ProductDetailPage(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => const EmptyPage(),
      );
  }
};
