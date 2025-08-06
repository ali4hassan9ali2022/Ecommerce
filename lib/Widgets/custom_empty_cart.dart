import 'package:e_commerce/Core/Utils/strings.dart';
import 'package:e_commerce/Widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CustomEmptyCart extends StatelessWidget {
  const CustomEmptyCart({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            Image.asset(
              image,
              height: size.height * 0.35,
              width: double.infinity,
            ),
            Text(
              Strings.whoops,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            SizedBox(height: 20),
            Text(
              Strings.yourCartIsEmpty,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
            Text(
              Strings.looksLike,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 20),
            CustomButton(
              borderRadius: 12,
              color: Colors.blueAccent,
              padding: EdgeInsets.all(20),
              child: Text(
                Strings.shopNow,
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
