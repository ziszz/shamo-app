part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class OnLogin extends AuthEvent {
  final String email;
  final String password;

  const OnLogin({required this.email, required this.password});
}
