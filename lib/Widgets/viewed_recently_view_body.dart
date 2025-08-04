import 'package:e_commerce/Core/Utils/assets.dart';
import 'package:e_commerce/Widgets/custom_empty_cart.dart';
import 'package:flutter/material.dart';

class ViewedRecentlyViewBody extends StatelessWidget {
  const ViewedRecentlyViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomEmptyCart(image: Assets.imagesOrder);
  }
}