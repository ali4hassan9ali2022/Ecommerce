import 'package:e_commerce/Core/Utils/assets.dart';
import 'package:e_commerce/Widgets/custom_empty_cart.dart';
import 'package:flutter/material.dart';

class WishlistViewBody extends StatelessWidget {
  const WishlistViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomEmptyCart(image: Assets.imagesBagWish);
  }
}
