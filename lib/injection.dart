import 'dart:io';

import 'package:auth/auth.dart';
import 'package:get_it/get_it.dart';
import 'package:http/io_client.dart';
import 'package:product/domain/usecases/checkout.dart';
import 'package:product/domain/usecases/get_categories.dart';
import 'package:product/domain/usecases/get_products.dart';
import 'package:product/domain/usecases/get_transactions.dart';
import 'package:product/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;

void init(HttpClient httpClient, SharedPreferences prefs) async {
  // blocs
  locator.registerFactory<AuthBloc>(
    () => AuthBloc(
        locator(), locator(), locator(), locator(), locator(), locator()),
  );
  locator.registerFactory<ProductBloc>(() => ProductBloc(locator()));

  // cubit
  locator.registerFactory<PageCubit>(() => PageCubit());

  // use cases
  locator.registerLazySingleton<UserLogin>(
    () => UserLogin(locator()),
  );
  locator.registerLazySingleton<UserRegister>(
    () => UserRegister(locator()),
  );
  locator.registerLazySingleton<UserLogout>(
    () => UserLogout(locator()),
  );
  locator.registerLazySingleton<GetUser>(
    () => GetUser(locator()),
  );
  locator.registerLazySingleton<UpdateProfile>(
    () => UpdateProfile(locator()),
  );
  locator.registerLazySingleton<GetActiveUser>(
    () => GetActiveUser(locator()),
  );
  locator.registerLazySingleton<GetProducts>(
    () => GetProducts(locator()),
  );
  locator.registerLazySingleton<GetCategories>(
    () => GetCategories(locator()),
  );
  locator.registerLazySingleton<GetTransactions>(
    () => GetTransactions(locator()),
  );
  locator.registerLazySingleton<Checkout>(
    () => Checkout(locator()),
  );

  // repositories
  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(locator(), locator()),
  );
  locator.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(locator()),
  );

  // data sources
  locator.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(locator()),
  );
  locator.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(locator()),
  );
  locator.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(locator()),
  );

  // external
  locator.registerLazySingleton<IOClient>(() => IOClient(httpClient));

  //preferences
  locator.registerLazySingleton<UserPreferences>(() => UserPreferences(prefs));
}
