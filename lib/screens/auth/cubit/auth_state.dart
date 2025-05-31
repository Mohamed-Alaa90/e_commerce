import '../../../models/AuthModel.dart';

abstract class AuthState {}

class InitAuthState extends AuthState {}

class LoadingAuthState extends AuthState {}

class SuccessAuthState extends AuthState {
  final AuthModel loginModel;

  SuccessAuthState(this.loginModel);
}

class ErrorAuthState extends AuthState {
  final String errorMessage;

  ErrorAuthState({required this.errorMessage});
}

class AuthCodeSentSuccess extends AuthState {}

class AuthCodeSentError extends AuthState {
  final String errorMessage;
  AuthCodeSentError({required this.errorMessage});
}

class AuthCodeSentLoading extends AuthState {}

class VerifyResetCodeSuccess extends AuthState {}

class VerifyResetCodeError extends AuthState {
  final String errorMessage;
  VerifyResetCodeError({required this.errorMessage});
}

class VerifyResetCodeLoading extends AuthState {}
