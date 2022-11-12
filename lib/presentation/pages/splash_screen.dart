import 'package:flutter/material.dart';
import 'package:shamo_app/presentation/pages/login_page.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "/splash";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.pushNamedAndRemoveUntil(
        context,
        LoginPage.routeName,
        (route) => false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Image.asset(
            "assets/app-logo.png",
          ),
        ),
      ),
    );
  }
}
