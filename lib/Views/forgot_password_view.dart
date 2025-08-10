import 'package:e_commerce/Core/Utils/assets.dart';
import 'package:e_commerce/Core/Utils/strings.dart';
import 'package:e_commerce/Widgets/app_shimmer%20.dart';
import 'package:e_commerce/Widgets/custom_button.dart';
import 'package:e_commerce/Widgets/custom_text_form_field.dart';
import 'package:e_commerce/Widgets/my_validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
       
        centerTitle: true,
        title: ShimmerText(text: Strings.shopSmart),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 30),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                Assets.imagesForgotPassword,
                width: size.width * 0.6,
                height: size.width * 0.6,
              ),
            ),
            SizedBox(height: 40),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Forgot password",

                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              "Please enter the email address you'd like your password reset information sent to",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 50),
            CustomTextFormField(
              validator: (value) {
                return MyValidators.emailValidator(value);
              },
              onFieldSubmitted: (value) {
                // FocusScope.of(
                //   context,
                // ).requestFocus(loginCibit.passwordNode);
              },
              keyboardType: TextInputType.emailAddress,
              // controller: loginCibit.emailController,
              // focusNode: loginCibit.emailNode,
              hintText: Strings.hintEmail,
              maxLines: 1,
              prefixIcon: Icon(Icons.email_outlined, color: Colors.grey),
            ),
            SizedBox(height: 30),
            CustomButton(
              height: 50,
              width: double.infinity,
              borderRadius: 12,
              color: Colors.blueAccent,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(IconlyBold.send),
                    SizedBox(width: 2),
                    Text(
                      "Request link",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
