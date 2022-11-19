import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shamo_app/presentation/pages/splash_screen.dart';
import 'package:shamo_app/utilities/app_colors.dart';
import 'package:shamo_app/utilities/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        tabBarTheme: const TabBarTheme(
          indicatorSize: TabBarIndicatorSize.label,
          labelPadding: EdgeInsets.symmetric(horizontal: 8),
          unselectedLabelColor: AppColors.grey,
          splashFactory: NoSplash.splashFactory,
        ),
        appBarTheme: const AppBarTheme(
          surfaceTintColor: AppColors.black1,
          backgroundColor: AppColors.black1,
        ),
        scaffoldBackgroundColor: AppColors.black1,
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      initialRoute: SplashScreen.routeName,
      onGenerateRoute: router,
    );
  }
}
