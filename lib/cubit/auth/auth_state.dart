abstract class AuthState {}

class InitAuthState extends AuthState {}

class LoadingAuthState extends AuthState {}

class SuccessAuthState extends AuthState {}

class ErrorAuthState extends AuthState {
  final String errorMessage;

  ErrorAuthState({required this.errorMessage});
}
