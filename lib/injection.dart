import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:http/io_client.dart';
import 'package:shamo_app/data/datasources/local/auth_local_data_source.dart';
import 'package:shamo_app/data/datasources/remote/auth_remote_data_source.dart';
import 'package:shamo_app/data/datasources/remote/product_remote_data_source.dart';
import 'package:shamo_app/data/repositories/auth_repository_impl.dart';
import 'package:shamo_app/data/repositories/product_repository_impl.dart';
import 'package:shamo_app/domain/repositories/auth_repository.dart';
import 'package:shamo_app/domain/repositories/product_repository.dart';
import 'package:shamo_app/domain/usecases/get_user.dart';
import 'package:shamo_app/domain/usecases/update_profile.dart';
import 'package:shamo_app/domain/usecases/user_login.dart';
import 'package:shamo_app/domain/usecases/user_logout.dart';
import 'package:shamo_app/domain/usecases/user_register.dart';
import 'package:shamo_app/presentation/bloc/auth/auth_bloc.dart';
import 'package:shamo_app/presentation/cubit/page_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;

Future<SharedPreferences> get prefs async =>
    await SharedPreferences.getInstance();

void init(HttpClient httpClient) {
  // blocs
  locator.registerFactory<AuthBloc>(
    () => AuthBloc(
      userLogin: locator(),
      userRegister: locator(),
      userLogout: locator(),
      getUser: locator(),
      updateProfile: locator(),
    ),
  );

  // cubit
  locator.registerFactory<PageCubit>(() => PageCubit());

  // use cases
  locator.registerLazySingleton<UserLogin>(
    () => UserLogin(repository: locator()),
  );
  locator.registerLazySingleton<UserRegister>(
    () => UserRegister(repository: locator()),
  );
  locator.registerLazySingleton<UserLogout>(
    () => UserLogout(repository: locator()),
  );
  locator.registerLazySingleton<GetUser>(
    () => GetUser(repository: locator()),
  );
  locator.registerLazySingleton<UpdateProfile>(
    () => UpdateProfile(repository: locator()),
  );

  // repositories
  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );
  locator.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(remoteDataSource: locator()),
  );

  // data sources
  locator.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(prefs: locator()),
  );
  locator.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(client: locator()),
  );
  locator.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(client: locator()),
  );

  // external
  locator.registerLazySingleton<IOClient>(() => IOClient(httpClient));
}
