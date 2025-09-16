import 'package:e_commerce/Core/Database/Local/supabase_helper.dart';
import 'package:e_commerce/Core/Utils/assets.dart';
import 'package:e_commerce/Cubit/cart_cubit/cart_cubit.dart';
import 'package:e_commerce/Cubit/cart_cubit/cart_state.dart';
import 'package:e_commerce/Widgets/custom_cart.dart';
import 'package:e_commerce/Widgets/custom_cart_checkout.dart';
import 'package:e_commerce/Widgets/custom_empty_cart.dart';
import 'package:e_commerce/Widgets/toast_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() {
    BlocProvider.of<CartCubit>(context).getCartItems();
  }

  @override
  Widget build(BuildContext context) {
    final user = SupabaseHelper.supabase.auth.currentUser;
    if (user == null) {
      return CustomEmptyCart(image: Assets.imagesShoes);
    }

    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) async {
        if (state is SuccessRemoveProductFromCartState) {
          CustomToastWidget.showSuccessToast("Delete product successful");
          await BlocProvider.of<CartCubit>(context).getCartItems();
        } else if (state is FailureRemoveProductFromCartState) {
          CustomToastWidget.showErrorToast("Delete product failed");
        }
      },
      builder: (context, state) {
        if (state is LoadingGetCartItemsState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SuccessGetCartItemsState) {
          final cartItems = state.cartItems;
          if (cartItems.isEmpty) {
            return const Center(child: Text("Your cart is empty"));
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cartItems[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomCart(cartItem: item),
                    );
                  },
                ),
              ),
              const CustomCartCheckout(),
            ],
          );
        } else if (state is FailureGetCartItemsState) {
          return Center(child: Text("Error: ${state.errMessage}"));
        }
        return const Center(child: Text("Your cart is empty"));
      },
    );
  }
}
