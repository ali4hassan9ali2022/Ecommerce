import 'package:e_commerce/Core/Utils/assets.dart';
import 'package:flutter/material.dart';

class CategoryRounded extends StatelessWidget {
  const CategoryRounded({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(Assets.imagesShoes, width: 50, height: 50),
        SizedBox(height: 15),
        Text(
          "Shose",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
