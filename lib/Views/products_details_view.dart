import 'package:e_commerce/Widgets/app_shimmer%20.dart';
import 'package:e_commerce/Widgets/products_details_view_body.dart';
import 'package:flutter/material.dart';

class ProductsDetailsView extends StatelessWidget {
  const ProductsDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: ShimmerText(text: "ShopSmart"),),

      body: ProductsDetailsViewBody(),
    );
  }
}
