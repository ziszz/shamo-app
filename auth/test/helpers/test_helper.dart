import 'package:auth/data/datasources/local/auth_local_data_source.dart';
import 'package:auth/data/datasources/preferences/user_preferences.dart';
import 'package:auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:auth/domain/repositories/auth_repository.dart';
import 'package:auth/domain/usecases/get_active_user.dart';
import 'package:auth/domain/usecases/get_user.dart';
import 'package:auth/domain/usecases/update_profile.dart';
import 'package:auth/domain/usecases/user_login.dart';
import 'package:auth/domain/usecases/user_logout.dart';
import 'package:auth/domain/usecases/user_register.dart';
import 'package:auth/presentation/bloc/auth_bloc.dart';
import 'package:http/io_client.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  UserPreferences,
  AuthRemoteDataSource,
  AuthLocalDataSource,
  AuthRepository,
  UserLogin,
  UserRegister,
  UserLogout,
  GetUser,
  UpdateProfile,
  GetActiveUser,
  AuthBloc,
], customMocks: [
  MockSpec<IOClient>(as: #MockIOClient),
])
void main() {}
