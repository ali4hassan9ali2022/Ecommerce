import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:e_commerce/Widgets/custom_product_widget.dart';
import 'package:flutter/material.dart';

class WishlistViewBody extends StatelessWidget {
  const WishlistViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: DynamicHeightGridView(
        builder: (context, index) => CustomProductWidget(),
        itemCount: 10,
        crossAxisCount: 2,
      ),
    );
  }
}
