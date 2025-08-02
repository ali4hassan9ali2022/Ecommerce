import 'package:e_commerce/Widgets/custom_empty_cart.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return CustomEmptyCart(size: size);
  }
}
