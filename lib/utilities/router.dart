import 'package:go_router/go_router.dart';
import 'package:shamo_app/presentation/pages/login_page.dart';
import 'package:shamo_app/presentation/pages/main_page.dart';
import 'package:shamo_app/presentation/pages/sign_up_page.dart';
import 'package:shamo_app/presentation/pages/splash_screen.dart';

final router = GoRouter(
  initialLocation: SplashScreen.path,
  routerNeglect: false,
  routes: [
    GoRoute(
      path: SplashScreen.path,
      name: SplashScreen.routeName,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: LoginPage.path,
      name: LoginPage.routeName,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: SignUpPage.path,
      name: SignUpPage.routeName,
      builder: (context, state) => const SignUpPage(),
    ),
    GoRoute(
      path: MainPage.path,
      name: MainPage.routeName,
      builder: (context, state) => const MainPage(),
    ),
  ],
);
