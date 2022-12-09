import 'package:http/io_client.dart';
import 'package:mockito/annotations.dart';
import 'package:shamo_app/data/datasources/local/auth_local_data_source.dart';
import 'package:shamo_app/data/datasources/remote/auth_remote_data_source.dart';
import 'package:shamo_app/data/datasources/remote/product_remote_data_source.dart';
import 'package:shamo_app/domain/repositories/auth_repository.dart';
import 'package:shamo_app/domain/repositories/product_repository.dart';
import 'package:shamo_app/domain/usecases/get_user.dart';
import 'package:shamo_app/domain/usecases/update_profile.dart';
import 'package:shamo_app/domain/usecases/user_login.dart';
import 'package:shamo_app/domain/usecases/user_logout.dart';
import 'package:shamo_app/domain/usecases/user_register.dart';
import 'package:shamo_app/presentation/bloc/auth/auth_bloc.dart';

@GenerateMocks([
  ProductRemoteDataSource,
  AuthRemoteDataSource,
  ProductRepository,
  AuthLocalDataSource,
  AuthRepository,
  UserLogin,
  UserRegister,
  UserLogout,
  GetUser,
  UpdateProfile,
  AuthBloc,
], customMocks: [
  MockSpec<IOClient>(as: #MockIOClient),
])
void main() {}
