import 'package:e_commerce/Models/products_models.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class LatestArrivals extends StatelessWidget {
  const LatestArrivals({super.key, required this.productsModels});
  final ProductsModels productsModels;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.favorite, color: Colors.red),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add_shopping_cart_rounded,
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
  }
}
