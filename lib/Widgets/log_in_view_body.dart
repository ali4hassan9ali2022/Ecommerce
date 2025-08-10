import 'dart:developer';

import 'package:e_commerce/Core/Utils/app_router.dart';
import 'package:e_commerce/Core/Utils/strings.dart';
import 'package:e_commerce/Cubit/log_in_cubit/log_in_cubit.dart';
import 'package:e_commerce/Cubit/log_in_cubit/log_in_state.dart';
import 'package:e_commerce/Widgets/app_shimmer%20.dart';
import 'package:e_commerce/Widgets/custom_button.dart';
import 'package:e_commerce/Widgets/custom_text_form_field.dart';
import 'package:e_commerce/Widgets/my_validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class LogInViewBody extends StatelessWidget {
  const LogInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var loginCibit = BlocProvider.of<LogInCubit>(context);
    return BlocConsumer<LogInCubit, LogInState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Form(
              key: loginCibit.globalKey,
              child: Column(
                children: [
                  SizedBox(height: 100),
                  Align(
                    alignment: Alignment.center,
                    child: ShimmerText(text: Strings.shopSmart, fontSize: 28),
                  ),
                  SizedBox(height: 20),
                  Text(
                    Strings.welcomeBack,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    Strings.let,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  SizedBox(height: 30),
                  CustomTextFormField(
                    validator: (value) {
                      return MyValidators.emailValidator(value);
                    },
                    onFieldSubmitted: (value) {
                      FocusScope.of(
                        context,
                      ).requestFocus(loginCibit.passwordNode);
                      log("Love Mariam");
                    },
                    keyboardType: TextInputType.emailAddress,
                    controller: loginCibit.emailController,
                    focusNode: loginCibit.emailNode,
                    hintText: Strings.hintEmail,
                    maxLines: 1,
                    prefixIcon: Icon(Icons.email_outlined, color: Colors.grey),
                  ),
                  SizedBox(height: 10),
                  CustomTextFormField(
                    validator: (value) {
                      return MyValidators.passwordValidator(value);
                    },
                    onFieldSubmitted: (value) {
                      log("Love Mariam");
                    },
                    controller: loginCibit.passwordController,
                    focusNode: loginCibit.passwordNode,
                    hintText: "********",
                    maxLines: 1,
                    prefixIcon: Icon(IconlyLight.password, color: Colors.grey),
                    obscureText: loginCibit.isObsecure,
                    suffixIcon: IconButton(
                      onPressed: () {
                        loginCibit.changePasswordVisibility();
                      },
                      icon: Icon(loginCibit.suffix),
                    ),
                  ),
                  SizedBox(height: 7),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      Strings.forgotPassword,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blueAccent,
                        decoration: TextDecoration.underline,
                        fontStyle: FontStyle.italic,
                        decorationColor: Colors.blue,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  CustomButton(
                    onTap: () {
                      // if (loginCibit.globalKey.currentState!.validate()) {}
                      GoRouter.of(context).pushReplacement(AppRouter.kMainView);
                    },
                    borderRadius: 12,
                    color: Colors.grey[200],
                    height: 40,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        Strings.signIn,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      Strings.orConnect,
                      style: TextStyle(fontSize: 20, color: Colors.grey[300]),
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          label: Text(
                            Strings.signInWithGoogle,
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                          icon: Icon(
                            FontAwesomeIcons.google,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      SizedBox(width: 7),
                      Expanded(
                        flex: 2,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Center(
                            child: Text(
                              Strings.guset,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.deepPurpleAccent,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 80),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        Strings.dontHaveAnAccount,
                        style: TextStyle(fontSize: 18),
                      ),
                      GestureDetector(
                        onTap: () {
                          GoRouter.of(context).push(AppRouter.kSignUpView);
                        },
                        child: Text(
                          Strings.signUp,
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
