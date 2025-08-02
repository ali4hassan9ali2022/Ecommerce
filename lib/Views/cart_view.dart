import 'package:e_commerce/Widgets/custom_cart.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) =>
          Padding(padding: const EdgeInsets.all(8.0), child: CustomCart()),
      itemCount: 10,
    );
  }
}
