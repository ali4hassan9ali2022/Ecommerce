import 'package:e_commerce/Models/user_model.dart';

abstract class ProfileState {}

class InitialProfileState extends ProfileState {}

class LoadingProfileAndPostsState extends ProfileState {}

class SuccessProfileAndPostsState extends ProfileState {
  final UserModel userModel;

  SuccessProfileAndPostsState({required this.userModel});
}

class FailureProfileState extends ProfileState {
  final String errMessage;
  FailureProfileState({required this.errMessage});
}
