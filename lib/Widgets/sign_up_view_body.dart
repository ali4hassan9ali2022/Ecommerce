import 'dart:developer';

import 'package:e_commerce/Core/Utils/strings.dart';
import 'package:e_commerce/Cubit/sign_up_cubit/sign_up_cubit.dart';
import 'package:e_commerce/Cubit/sign_up_cubit/sign_up_state.dart';
import 'package:e_commerce/Widgets/app_shimmer%20.dart';
import 'package:e_commerce/Widgets/custom_button.dart';
import 'package:e_commerce/Widgets/custom_text_form_field.dart';
import 'package:e_commerce/Widgets/my_validators.dart';
import 'package:e_commerce/Widgets/pick_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:go_router/go_router.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var signUpCibit = BlocProvider.of<SignUpCubit>(context);
    var size = MediaQuery.of(context).size;
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Form(
              key: signUpCibit.globalKey,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: ShimmerText(text: Strings.shopSmart, fontSize: 28),
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      Strings.welcomeBack,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    Strings.letSignUp,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    width: size.width * 0.3,
                    height: size.width * 0.3,
                    child: PickImageWidget(signUpCubit: signUpCibit),
                  ),
                  SizedBox(height: 20),
                  CustomTextFormField(
                    validator: (value) {
                      return MyValidators.displayNamevalidator(value);
                    },
                    onFieldSubmitted: (value) {
                      FocusScope.of(
                        context,
                      ).requestFocus(signUpCibit.emailNode);
                      log("Love Mariam");
                    },
                    keyboardType: TextInputType.text,
                    controller: signUpCibit.nameController,
                    focusNode: signUpCibit.nameNode,
                    hintText: Strings.name,
                    maxLines: 1,
                    prefixIcon: Icon(Icons.person, color: Colors.grey),
                  ),
                  SizedBox(height: 10),
                  CustomTextFormField(
                    validator: (value) {
                      return MyValidators.emailValidator(value);
                    },
                    onFieldSubmitted: (value) {
                      FocusScope.of(
                        context,
                      ).requestFocus(signUpCibit.passwordNode);
                      log("Love Mariam");
                    },
                    controller: signUpCibit.emailController,
                    keyboardType: TextInputType.emailAddress,
                    focusNode: signUpCibit.emailNode,
                    hintText: Strings.hintEmail,
                    maxLines: 1,
                    prefixIcon: Icon(Icons.email, color: Colors.grey),
                  ),
                  SizedBox(height: 10),
                  CustomTextFormField(
                    validator: (value) {
                      return MyValidators.passwordValidator(value);
                    },
                    onFieldSubmitted: (value) {
                      FocusScope.of(
                        context,
                      ).requestFocus(signUpCibit.confirmPasswordNode);
                      log("Love Mariam");
                    },
                    controller: signUpCibit.passwordController,
                    keyboardType: TextInputType.text,
                    focusNode: signUpCibit.passwordNode,
                    hintText: "********",
                    maxLines: 1,
                    prefixIcon: Icon(IconlyLight.password, color: Colors.grey),
                    obscureText: signUpCibit.isObsecure,
                    suffixIcon: IconButton(
                      onPressed: () {
                        signUpCibit.changePasswordVisibility();
                      },
                      icon: Icon(signUpCibit.suffix),
                    ),
                  ),
                  SizedBox(height: 10),
                  CustomTextFormField(
                    validator: (value) {
                      return MyValidators.repeatPasswordValidator(
                        value: value,
                        password: signUpCibit.passwordController.text,
                      );
                    },
                    onFieldSubmitted: (value) {
                      // FocusScope.of(
                      //   context,
                      // ).requestFocus(signUpCibit.passwordNode);
                      log("Love Mariam");
                    },
                    controller: signUpCibit.confirmPasswordController,
                    keyboardType: TextInputType.text,
                    focusNode: signUpCibit.confirmPasswordNode,
                    hintText: Strings.confirmPassword,
                    maxLines: 1,
                    prefixIcon: Icon(IconlyLight.password, color: Colors.grey),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.visibility_off),
                    ),
                  ),
                  SizedBox(height: 40),
                  CustomButton(
                    onTap: () {
                      if (signUpCibit.globalKey.currentState!.validate()) {}
                    },
                    borderRadius: 12,
                    color: Colors.grey[200],
                    height: 40,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        Strings.signUp,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        Strings.alreadyHaveAnAccount,
                        style: TextStyle(fontSize: 18),
                      ),
                      GestureDetector(
                        onTap: () {
                          GoRouter.of(context).pop();
                        },
                        child: Text(
                          Strings.signIn,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
