import 'package:e_commerce/Models/user_model.dart';

abstract class ProfileState {}

class InitialProfileState extends ProfileState {}

class LoadingProfileState extends ProfileState {}

class SuccessProfileState extends ProfileState {
  final UserModel userModel;

  SuccessProfileState({required this.userModel});
}

class FailureProfileState extends ProfileState {
  final String errMessage;
  FailureProfileState({required this.errMessage});
}
