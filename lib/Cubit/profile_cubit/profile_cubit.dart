import 'dart:developer';

import 'package:e_commerce/Core/Database/Local/supabase_helper.dart';
import 'package:e_commerce/Core/Helper/app_helper.dart';
import 'package:e_commerce/Cubit/profile_cubit/profile_state.dart';
import 'package:e_commerce/Models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(InitialProfileState());
  UserModel? userModel;

  Future<void> fetchProfile() async {
    emit(LoadingProfileState());
    try {
      final user = SupabaseHelper.supabase.auth.currentUser;
      if (user == null) {
        emit(SuccessProfileState(userModel: UserModel.empty()));
        return;
      }
      final userResponse = await SupabaseHelper.supabase
          .from("users")
          .select()
          .eq("id", user.id)
          .maybeSingle();

      if (userResponse == null) {
        emit(FailureProfileState(errMessage: "User data not found"));
        return;
      }
      userModel = UserModel.fromJson(userResponse);
      AppHelper.userModel = userModel;
      log("Fetched User: ${userModel!.toJson()}");
      emit(SuccessProfileState(userModel: userModel!));
    } catch (e) {
      emit(FailureProfileState(errMessage: e.toString()));
    }
  }
}
