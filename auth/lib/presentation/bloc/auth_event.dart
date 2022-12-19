part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {}

class OnLogin extends AuthEvent {
  final String email;
  final String password;

  OnLogin({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class OnRegister extends AuthEvent {
  final String email;
  final String name;
  final String username;
  final String password;

  OnRegister({
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

  OnLogout({required this.token});

  @override
  List<Object?> get props => [token];
}

class OnGetUser extends AuthEvent {
  final String token;

  OnGetUser({required this.token});

  @override
  List<Object?> get props => [token];
}

class OnGetActiveUser extends AuthEvent {
  OnGetActiveUser();

  @override
  List<Object?> get props => [];
}

class OnUpdate extends AuthEvent {
  final String token;
  final String name;
  final String email;
  final String username;

  OnUpdate({
    required this.token,
    required this.name,
    required this.email,
    required this.username,
  });

  @override
  @override
  List<Object?> get props => [token, name, email, username];
}

class OnSaveUser extends AuthEvent {
  final String token;

  OnSaveUser({required this.token});

  @override
  List<Object?> get props => [token];
}

class OnRemoveUser extends AuthEvent {
  OnRemoveUser();

  @override
  List<Object?> get props => [];
}
