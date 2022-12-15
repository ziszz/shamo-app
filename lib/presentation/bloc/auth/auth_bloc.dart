import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamo_app/domain/entities/user.dart';
import 'package:shamo_app/domain/usecases/get_active_user.dart';
import 'package:shamo_app/domain/usecases/get_user.dart';
import 'package:shamo_app/domain/usecases/update_profile.dart';
import 'package:shamo_app/domain/usecases/user_login.dart';
import 'package:shamo_app/domain/usecases/user_logout.dart';
import 'package:shamo_app/domain/usecases/user_register.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserLogin userLogin;
  final UserRegister userRegister;
  final UserLogout userLogout;
  final GetUser getUser;
  final UpdateProfile updateProfile;
  final GetActiveUser getActiveUser;

  AuthBloc(
    this.userLogin,
    this.userRegister,
    this.userLogout,
    this.getUser,
    this.updateProfile,
    this.getActiveUser,
  ) : super(AuthInitial()) {
    on<OnGetUser>((event, emit) async {
      emit(AuthLoading());

      final token = event.token;

      final result = await getUser.execute(token);

      result.fold(
        (failure) => emit(AuthError(failure.message)),
        (result) => emit(AuthSuccess(result)),
      );
    });
    on<OnLogin>((event, emit) async {
      emit(AuthLoading());

      final email = event.email;
      final password = event.password;

      final result = await userLogin.execute(email, password);

      result.fold(
        (failure) => emit(AuthError(failure.message)),
        (result) => emit(AuthSuccess(result)),
      );
    });
    on<OnRegister>((event, emit) async {
      emit(AuthLoading());

      final name = event.name;
      final email = event.email;
      final username = event.username;
      final password = event.password;

      final result =
          await userRegister.execute(name, email, username, password);

      result.fold(
        (failure) => emit(AuthError(failure.message)),
        (result) => emit(AuthSuccess(result)),
      );
    });
    on<OnLogout>((event, emit) async {
      emit(AuthLoading());

      final token = event.token;

      final result = await userLogout.execute(token);

      result.fold(
        (failure) => emit(AuthError(failure.message)),
        (result) => emit(AuthInitial()),
      );
    });
    on<OnUpdate>((event, emit) async {
      emit(AuthLoading());

      final token = event.token;
      final name = event.name;
      final email = event.email;
      final username = event.username;

      final result = await updateProfile.execute(token, name, email, username);

      result.fold(
        (failure) => emit(AuthError(failure.message)),
        (result) => emit(AuthSuccess(result)),
      );
    });
    on<OnGetActiveUser>((event, emit) async {
      final result = await getActiveUser.execute();

      result.fold(
        (failure) => emit(AuthError(failure.message)),
        (result) => emit(AuthSuccess(result)),
      );
    });
  }
}
