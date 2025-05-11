abstract class LoginStates {}

class LoginSuccessState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginErrorState extends LoginStates {
  final String error;

  LoginErrorState(this.error);
}

class LoginInitialState extends LoginStates {}
