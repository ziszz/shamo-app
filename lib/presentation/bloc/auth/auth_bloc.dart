import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamo_app/domain/entities/user.dart';
import 'package:shamo_app/domain/usecases/get_user.dart';
import 'package:shamo_app/domain/usecases/remove_active_user.dart';
import 'package:shamo_app/domain/usecases/save_active_user.dart';
import 'package:shamo_app/domain/usecases/update_profile.dart';
import 'package:shamo_app/domain/usecases/user_login.dart';
import 'package:shamo_app/domain/usecases/user_logout.dart';
import 'package:shamo_app/domain/usecases/user_register.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserLogin _userLogin;
  final UserRegister _userRegister;
  final UserLogout _userLogout;
  final GetUser _getUser;
  final UpdateProfile _updateProfile;
  final SaveActiveUser _saveActiveUser;
  final RemoveActiveUser _removeActiveUser;

  AuthBloc(
    this._userLogin,
    this._userRegister,
    this._userLogout,
    this._getUser,
    this._updateProfile,
    this._saveActiveUser,
    this._removeActiveUser,
  ) : super(AuthInitial()) {
    on<OnGetCurrentUser>((event, emit) async {
      emit(AuthLoading());

      final token = event.token;

      final result = await _getUser.execute(token);

      result.fold(
        (failure) => emit(AuthError(message: failure.message)),
        (result) => emit(AuthSuccess(user: result)),
      );
    });
    on<OnLogin>((event, emit) async {
      emit(AuthLoading());

      final email = event.email;
      final password = event.password;

      final result = await _userLogin.execute(email, password);

      result.fold(
        (failure) => emit(AuthError(message: failure.message)),
        (result) => emit(AuthSuccess(user: result)),
      );
    });
    on<OnRegister>((event, emit) async {
      emit(AuthLoading());

      final name = event.name;
      final email = event.email;
      final username = event.username;
      final password = event.password;

      final result =
          await _userRegister.execute(name, email, username, password);

      result.fold(
        (failure) => emit(AuthError(message: failure.message)),
        (result) => emit(AuthSuccess(user: result)),
      );
    });
    on<OnLogout>((event, emit) async {
      emit(AuthLoading());

      final token = event.token;

      final result = await _userLogout.execute(token);

      result.fold(
        (failure) => emit(AuthError(message: failure.message)),
        (result) => emit(AuthInitial()),
      );
    });
    on<OnUpdate>((event, emit) async {
      emit(AuthLoading());

      final token = event.token;
      final name = event.name;
      final email = event.email;
      final username = event.username;

      final result = await _updateProfile.execute(token, name, email, username);

      result.fold(
        (failure) => emit(AuthError(message: failure.message)),
        (result) => emit(AuthSuccess(user: result)),
      );
    });
    on<OnSaveUser>((event, emit) async {
      emit(AuthLoading());

      final token = event.token;
      final result = await _saveActiveUser.execute(token);

      if (result) {
        emit(AuthOnSaveSuccess(isSaved: result));
      }
    });
    on<OnRemoveUser>((event, emit) async {
      emit(AuthLoading());

      final result = await _removeActiveUser.execute();

      if (result) {
        emit(AuthInitial());
      }
    });
  }
}
