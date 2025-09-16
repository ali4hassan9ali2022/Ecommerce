import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:e_commerce/Core/Database/Local/supabase_helper.dart';
import 'package:e_commerce/Core/Utils/app_router.dart';
import 'package:e_commerce/Core/Utils/assets.dart';
import 'package:e_commerce/Cubit/favorite_cubit/favorite_cubit.dart';
import 'package:e_commerce/Cubit/favorite_cubit/favorite_state.dart';
import 'package:e_commerce/Widgets/custom_empty_cart.dart';
import 'package:e_commerce/Widgets/custom_favorite_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class WishlistViewBody extends StatelessWidget {
  const WishlistViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var user = SupabaseHelper.supabase.auth.currentUser;

    return user == null
        ? CustomEmptyCart(image: Assets.imagesBagWish)
        : BlocBuilder<FavoriteCubit, FavoriteState>(
            builder: (context, state) {
              if (state is LoadingFavoriteProductsState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is SuccessLoadFavoriteProductsState) {
                final cartItems = state.cartItems;
                if (cartItems.isEmpty) {
                  return const Center(child: Text("Your cart is empty"));
                }

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  child: DynamicHeightGridView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    builder: (context, index) {
                      final item = cartItems[index];
                      return InkWell(
                        onTap: () async {
                          await GoRouter.of(
                            context,
                          ).push(AppRouter.kProductsDetails);
                        },
                        child: CustomFavoriteWidget(cartItem: item),
                      );
                    },
                    itemCount: state.cartItems.length,
                    crossAxisCount: 2,
                  ),
                );
              } else if (state is FailureLoadFavoriteProductsState) {
                return Center(child: Text("Error: ${state.errMessage}"));
              }
              return const Center(child: Text("Your cart is empty"));
            },
          );
  }
}
