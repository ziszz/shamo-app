import 'package:auth/presentation/bloc/auth_bloc.dart';
import 'package:core/core.dart';
import 'package:core/utilities/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:product/presentation/bloc/product_bloc.dart';
import 'package:product/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  di.init(
    await getHttpClient(),
    await SharedPreferences.getInstance(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.locator<AuthBloc>()),
        BlocProvider(create: (_) => di.locator<PageCubit>()),
        BlocProvider(create: (_) => di.locator<ProductBloc>())
      ],
      child: MaterialApp(
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
      ),
    );
  }
}
