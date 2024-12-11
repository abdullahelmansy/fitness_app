part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {}

class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {}
class AuthErrorState extends AuthState {
  final String error;

  AuthErrorState(this.error);
}

