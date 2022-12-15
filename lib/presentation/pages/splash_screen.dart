import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamo_app/presentation/bloc/auth/auth_bloc.dart';
import 'package:shamo_app/presentation/pages/login_page.dart';
import 'package:shamo_app/presentation/pages/main_page.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "/";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    final curUser = context.read<AuthBloc>().state;

    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (curUser is AuthOnSaveSuccess) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            MainPage.routeName,
            arguments: curUser.isSaved,
            (route) => false,
          );
        } else {
          Navigator.pushNamedAndRemoveUntil(
            context,
            LoginPage.routeName,
            (route) => false,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Image.asset(
            "assets/images/app-logo.png",
          ),
        ),
      ),
    );
  }
}
