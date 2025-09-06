abstract class HomeState {}

class HomeInitialState extends HomeState {}

class LoadingHomeState extends HomeState {}

class SuccessHomeState extends HomeState {}

class FailureHomeState extends HomeState {
  final String errMessage;

  FailureHomeState({required this.errMessage});
}
