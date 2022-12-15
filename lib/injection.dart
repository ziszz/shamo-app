import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:http/io_client.dart';
import 'package:shamo_app/data/datasources/local/auth_local_data_source.dart';
import 'package:shamo_app/data/datasources/preferences/user_preferences.dart';
import 'package:shamo_app/data/datasources/remote/auth_remote_data_source.dart';
import 'package:shamo_app/data/datasources/remote/product_remote_data_source.dart';
import 'package:shamo_app/data/repositories/auth_repository_impl.dart';
import 'package:shamo_app/data/repositories/product_repository_impl.dart';
import 'package:shamo_app/domain/repositories/auth_repository.dart';
import 'package:shamo_app/domain/repositories/product_repository.dart';
import 'package:shamo_app/domain/usecases/get_active_user.dart';
import 'package:shamo_app/domain/usecases/get_user.dart';
import 'package:shamo_app/domain/usecases/update_profile.dart';
import 'package:shamo_app/domain/usecases/user_login.dart';
import 'package:shamo_app/domain/usecases/user_logout.dart';
import 'package:shamo_app/domain/usecases/user_register.dart';
import 'package:shamo_app/presentation/bloc/auth/auth_bloc.dart';
import 'package:shamo_app/presentation/cubit/page_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;

void init(HttpClient httpClient, SharedPreferences prefs) async {
  // blocs
  locator.registerFactory<AuthBloc>(
    () => AuthBloc(
        locator(), locator(), locator(), locator(), locator(), locator()),
  );

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
