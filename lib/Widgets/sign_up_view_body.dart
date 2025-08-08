import 'package:e_commerce/Core/Utils/strings.dart';
import 'package:e_commerce/Widgets/app_shimmer%20.dart';
import 'package:flutter/material.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
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
              Strings.letSignUp,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
