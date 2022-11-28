import 'package:flutter/material.dart';
import 'package:http/io_client.dart';
import 'package:mockito/annotations.dart';
import 'package:shamo_app/data/datasources/auth_remote_data_source.dart';
import 'package:shamo_app/data/datasources/product_remote_data_source.dart';
import 'package:shamo_app/domain/repositories/auth_repository.dart';
import 'package:shamo_app/domain/repositories/product_repository.dart';
import 'package:shamo_app/domain/usecases/user_login.dart';
import 'package:shamo_app/domain/usecases/user_register.dart';
import 'package:shamo_app/presentation/bloc/auth/auth_bloc.dart';

@GenerateMocks([
  NavigatorObserver,
  ProductRemoteDataSource,
  AuthRemoteDataSource,
  ProductRepository,
  AuthRepository,
  UserLogin,
  UserRegister,
  AuthBloc,
], customMocks: [
  MockSpec<IOClient>(as: #MockIOClient)
])
void main() {}
