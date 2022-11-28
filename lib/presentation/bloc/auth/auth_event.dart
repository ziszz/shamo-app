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

  @override
  List<Object?> get props => [email, password];
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

  @override
  List<Object?> get props => [email, name, username, password];
}

class OnLogout extends AuthEvent {
  final String token;

  const OnLogout({required this.token});

  @override
  List<Object?> get props => [token];
}

class FetchUser extends AuthEvent {
  final String token;

  const FetchUser({required this.token});

  @override
  List<Object?> get props => [token];
}
