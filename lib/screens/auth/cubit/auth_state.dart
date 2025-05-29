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

class AuthCodeSent extends AuthState {}
