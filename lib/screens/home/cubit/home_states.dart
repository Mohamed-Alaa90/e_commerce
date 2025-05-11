abstract class HomeStates {}

class HomeSuccessState extends HomeStates {}

class HomeInitState extends HomeStates {}

class HomeErrorState extends HomeStates {
  String errorMessage;

  HomeErrorState({required this.errorMessage});
}
