import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:http/io_client.dart';
import 'package:shamo_app/data/datasources/auth_remote_data_source.dart';
import 'package:shamo_app/data/datasources/product_remote_data_source.dart';
import 'package:shamo_app/data/repositories/auth_repository_impl.dart';
import 'package:shamo_app/data/repositories/product_repository_impl.dart';
import 'package:shamo_app/domain/repositories/auth_repository.dart';
import 'package:shamo_app/domain/repositories/product_repository.dart';
import 'package:shamo_app/domain/usecases/user_login.dart';
import 'package:shamo_app/presentation/bloc/auth/auth_bloc.dart';

final locator = GetIt.instance;

void init(HttpClient httpClient) {
  // blocs
  locator.registerFactory<AuthBloc>(
    () => AuthBloc(userLogin: locator()),
  );

  // use cases
  locator.registerLazySingleton<UserLogin>(
    () => UserLogin(repository: locator()),
  );

  // repositories
  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(remoteDataSource: locator()),
  );
  locator.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(remoteDataSource: locator()),
  );

  // data sources
  locator.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(client: locator()),
  );
  locator.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(client: locator()),
  );

  // external
  locator.registerLazySingleton<IOClient>(() => IOClient(httpClient));
}
