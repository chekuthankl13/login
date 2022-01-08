part of 'authentication_cubit.dart';

@immutable
abstract class AuthenticationState {
  final User? user;
  final String? error;

  const AuthenticationState({this.user, this.error});
}

class AuthenticationInitial extends AuthenticationState {}

//signup state

class SigninLoading extends AuthenticationState {
  const SigninLoading();
}

class SigninSuccess extends AuthenticationState {
  const SigninSuccess({required User user}) : super(user: user);
}

class SigninError extends AuthenticationState {
  const SigninError({required String er}) : super(error: er);
}

//login

class LoginLoading extends AuthenticationState {
  const LoginLoading();
}

class LoginSuccess extends AuthenticationState {
  const LoginSuccess({required User user}) : super(user: user);
}

class LoginError extends AuthenticationState {
  const LoginError({required String err}) : super(error: err);
}

//forgot password

class ForgotPswLoading extends AuthenticationState {
  const ForgotPswLoading();
}

class ForgotPswSuccess extends AuthenticationState {
  const ForgotPswSuccess();
}

class ForgotPswError extends AuthenticationState {
  const ForgotPswError({required String? err}) : super(error: err);
}

// //auth

class AuthIn extends AuthenticationState {
  const AuthIn();
}

class AuthOut extends AuthenticationState {
  const AuthOut();
}
