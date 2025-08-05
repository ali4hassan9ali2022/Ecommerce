import 'package:e_commerce/Widgets/app_shimmer%20.dart';
import 'package:e_commerce/Widgets/custom_button.dart';
import 'package:e_commerce/Widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LogInViewBody extends StatelessWidget {
  const LogInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 100),
            Align(
              alignment: Alignment.center,
              child: ShimmerText(text: "ShopSmart", fontSize: 28),
            ),
            SizedBox(height: 20),
            Text(
              "Welcome Back!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              "Let't get you Logged in so ypu can start shopping",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 30),
            CustomTextFormField(
              hintText: "youremail@gmail.com",
              prefixIcon: Icon(Icons.email_outlined, color: Colors.grey),
            ),
            SizedBox(height: 10),
            CustomTextFormField(
              hintText: "********",
              prefixIcon: Icon(IconlyLight.password, color: Colors.grey),
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.visibility_off),
              ),
            ),
            SizedBox(height: 7),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "forgot password? ",

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
              borderRadius: 12,
              color: Colors.grey[200],
              height: 40,
              width: double.infinity,
              child: Center(
                child: Text(
                  "Sign In",
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
                "OR CONNECT USIGN",
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
                      "Sign in with Google",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    icon: Icon(FontAwesomeIcons.google, color: Colors.red),
                  ),
                ),
                SizedBox(width: 7),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Center(
                      child: Text(
                        "Guest?",
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
                Text("Don't have an account? ", style: TextStyle(fontSize: 18)),
                Text(
                  "Sign up",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
