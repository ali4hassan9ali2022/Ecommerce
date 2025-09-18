import 'package:e_commerce/Cubit/cart_cubit/cart_cubit.dart';
import 'package:e_commerce/Cubit/cart_cubit/cart_state.dart';
import 'package:e_commerce/Cubit/favorite_cubit/favorite_cubit.dart';
import 'package:e_commerce/Cubit/favorite_cubit/favorite_state.dart';
import 'package:e_commerce/Models/products_models.dart';
import 'package:e_commerce/Widgets/toast_widget.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LatestArrivals extends StatelessWidget {
  const LatestArrivals({super.key, required this.productsModels});
  final ProductsModels productsModels;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var cartCubit = BlocProvider.of<CartCubit>(context);
    var favCubit = BlocProvider.of<FavoriteCubit>(context);
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state is SuccessAddProductToCartState) {
          CustomToastWidget.showSuccessToast("Product added to cart");
        } else if (state is FailureAddProductToCartState) {
          CustomToastWidget.showErrorToast(state.errMessage);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: SizedBox(
            width: size.width * 0.44,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: FancyShimmerImage(
                      imageUrl: productsModels.productImage,
                      height: size.width * 0.44,
                      width: size.width * 0.44,
                    ),
                  ),
                ),
                SizedBox(width: 7),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productsModels.productTitle,
                        style: TextStyle(fontSize: 18),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      FittedBox(
                        child: Row(
                          children: [
                            BlocBuilder<FavoriteCubit, FavoriteState>(
                              builder: (context, state) {
                                final isFav = favCubit.favoriteProductIds
                                    .contains(productsModels.productId);
                                return IconButton(
                                  onPressed: () {
                                    favCubit.toggleFavorite(
                                      productId: productsModels.productId,
                                    );
                                  },
                                  icon: Icon(
                                    Icons.favorite,
                                    color: isFav ? Colors.red : Colors.grey,
                                  ),
                                );
                              },
                            ),
                            IconButton(
                              onPressed: () {
                                cartCubit.addProductToMyCart(
                                  productId: productsModels.productId,
                                );
                              },
                              icon: Icon(
                                state is SuccessAddProductToCartState &&
                                        state.productId ==
                                            productsModels.productId
                                    ? Icons.check
                                    : Icons.add_shopping_cart_rounded,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Text(
                        "${productsModels.productPrice}\$",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),

                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
