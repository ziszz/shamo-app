part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final User user;

  const AuthSuccess({required this.user});
}

class AuthLogoutSuccess extends AuthState {
  final bool isLogout;

  const AuthLogoutSuccess({required this.isLogout});
}

class AuthError extends AuthState {
  final String message;

  const AuthError({required this.message});
}
