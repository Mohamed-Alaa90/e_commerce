import '../../../models/AuthModel.dart';

abstract class AuthState {}

class InitAuthState extends AuthState {}
///register

class LoadingRegisterState extends AuthState {}

class SuccessRegisterState extends AuthState {

}

class ErrorRegisterState extends AuthState {
  final String errorMessage;

  ErrorRegisterState({required this.errorMessage});
}

/// login

class LoadingLoginState extends AuthState {}

class SuccessLoginState extends AuthState {
  final AuthModel loginModel;

  SuccessLoginState(this.loginModel);
}

class ErrorLoginState extends AuthState {
  final String errorMessage;

  ErrorLoginState({required this.errorMessage});
}

/// sendCode
class AuthCodeSentSuccess extends AuthState {}

class AuthCodeSentError extends AuthState {
  final String errorMessage;
  AuthCodeSentError({required this.errorMessage});
}

class AuthCodeSentLoading extends AuthState {}

/// VerifyResetCode
class VerifyResetCodeSuccess extends AuthState {}

class VerifyResetCodeError extends AuthState {
  final String errorMessage;
  VerifyResetCodeError({required this.errorMessage});
}

class VerifyResetCodeLoading extends AuthState {}

/// resetPassword
class ResetPasswordSuccess extends AuthState {}

class ResetPasswordError extends AuthState {
  final String errorMessage;

  ResetPasswordError({required this.errorMessage});
}

class ResetPasswordLoading extends AuthState {}

/// verifyToken
class VerifyTokenLoading extends AuthState {}

class VerifyTokenSuccess extends AuthState {}

class VerifyTokenError extends AuthState {
  final String errorMessage;
  VerifyTokenError({required this.errorMessage});
}
