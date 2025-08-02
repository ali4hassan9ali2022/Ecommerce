import 'package:e_commerce/Core/Utils/assets.dart';
import 'package:e_commerce/Widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CustomEmptyCart extends StatelessWidget {
  const CustomEmptyCart({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            Image.asset(
              Assets.imagesShoppingCart,
              height: size.height * 0.35,
              width: double.infinity,
            ),
            Text(
              "Whoops!",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Your cart is empty",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
            Text(
              "Looks like you haven't added anything to your cart yet.",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 20),
            CustomButton(
              borderRadius: 12,
              color: Colors.blueAccent,
              padding: EdgeInsets.all(20),
              child: Text("Shop Now", style: TextStyle(fontSize: 22)),
            ),
          ],
        ),
      ),
    );
  }
}
