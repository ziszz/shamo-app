import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamo_app/domain/entities/user.dart';
import 'package:shamo_app/domain/usecases/user_login.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserLogin userLogin;

  AuthBloc({required this.userLogin}) : super(AuthInitial()) {
    on<OnLogin>((event, emit) async {
      emit(AuthLoading());

      final email = event.email;
      final password = event.password;

      final result = await userLogin.execute(email, password);

      result.fold(
        (failure) => emit(AuthError(message: failure.message)),
        (result) => emit(AuthLoaded(user: result)),
      );
    });
  }
}
