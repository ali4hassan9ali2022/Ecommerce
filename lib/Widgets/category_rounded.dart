import 'package:e_commerce/Models/category_model.dart';
import 'package:flutter/material.dart';

class CategoryRounded extends StatelessWidget {
  const CategoryRounded({super.key, required this.categoryModel});
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(categoryModel.image, width: 50, height: 50),
        SizedBox(height: 15),
        Text(
          categoryModel.title,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
