import 'package:e_commerce/Core/Helper/app_helper.dart';
import 'package:e_commerce/Core/Utils/strings.dart';
import 'package:e_commerce/Cubit/cart_cubit/cart_cubit.dart';
import 'package:e_commerce/Cubit/cart_cubit/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCartCheckout extends StatelessWidget {
  const CustomCartCheckout({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return state is SuccessGetCartItemsState
            ? Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  border: Border(top: BorderSide(color: Colors.grey, width: 1)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "${Strings.total} (${state.cartItems.length} products / ${AppHelper.getTotalQuantity(state.cartItems)} items)",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            Text(
                              "${AppHelper.getTotalPrice(state.cartItems)}\$",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                        onPressed: () {},
                        child: Text(
                          Strings.checkout,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : SizedBox();
      },
    );
  }
}
