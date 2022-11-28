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

class OnRegister extends AuthEvent {
  final String email;
  final String name;
  final String username;
  final String password;

  const OnRegister({
    required this.email,
    required this.name,
    required this.username,
    required this.password,
  });
}

class OnLogout extends AuthEvent {
  final String token;

  const OnLogout({required this.token});
}
