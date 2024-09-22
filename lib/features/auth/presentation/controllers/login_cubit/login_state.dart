part of 'login_cubit.dart';

sealed class LoginState {
  const LoginState();
}

final class LoginInitialState extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginErrorState extends LoginState {
  Failure failure;

  LoginErrorState({required this.failure});
}

final class LoginSuccessState extends LoginState {
  LoginEntity loginEntity;

  LoginSuccessState({required this.loginEntity});
}
