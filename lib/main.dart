import 'package:flutter/material.dart';
import 'package:shamo_app/presentation/pages/splash_screen.dart';
import 'package:shamo_app/utilities/app_colors.dart';
import 'package:shamo_app/utilities/router.dart';
import 'package:shamo_app/utilities/typography.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.black1,
        ),
        scaffoldBackgroundColor: AppColors.black1,
        useMaterial3: true,
        textTheme: typography,
      ),
      initialRoute: SplashScreen.routeName,
      onGenerateRoute: router,
    );
  }
}
