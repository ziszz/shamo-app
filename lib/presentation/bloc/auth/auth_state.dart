part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLoading extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthSuccess extends AuthState {
  final User user;

  AuthSuccess(this.user);

  @override
  List<Object> get props => [user];
}

class AuthGetTokenSuccess extends AuthState {
  final String token;

  AuthGetTokenSuccess(this.token);

  @override
  List<Object> get props => [token];
}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);

  @override
  List<Object> get props => [message];
}
