import 'package:e_commerce/Core/Database/Local/supabase_helper.dart';
import 'package:e_commerce/Core/Utils/assets.dart';
import 'package:e_commerce/Widgets/custom_cart.dart';
import 'package:e_commerce/Widgets/custom_cart_checkout.dart';
import 'package:e_commerce/Widgets/custom_empty_cart.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final user = SupabaseHelper.supabase.auth.currentUser;
    return user == null
        ? CustomEmptyCart(image: Assets.imagesShoes)
        : Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomCart(),
                  ),
                  itemCount: 10,
                ),
              ),
              CustomCartCheckout(),
            ],
          );
  }
}
