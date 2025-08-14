import 'package:e_commerce/Cubit/sign_up_cubit/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitialState());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey();
  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();
  FocusNode nameNode = FocusNode();
  FocusNode confirmPasswordNode = FocusNode();
  XFile? imagePicker;
  IconData suffix = Icons.visibility_off_outlined;
  bool isObsecure = true;
  void changePasswordVisibility() {
    isObsecure = !isObsecure;

    suffix = isObsecure
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;
    emit(ChangePassworsVisibailitystate());
  }

  uploadProfilePic(XFile image) {
    imagePicker = image;
    emit(UploadProfilePic());
  }
   removeProfilePic() {
    imagePicker = null;
    emit(RemoveProfilePic());
  }
  
}
