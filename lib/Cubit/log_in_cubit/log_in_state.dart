abstract class LogInState {}
class LogInInitialState extends LogInState{}
class ChangePassworsVisibailitystate extends LogInState{}
class LoadingSignInState extends LogInState {}

class SuccessSignInState extends LogInState {}

class FailureSignInState extends LogInState {
  final String errMessage;

  FailureSignInState({required this.errMessage});
}