import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class ProductsDetailsViewBody extends StatelessWidget {
  const ProductsDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: FancyShimmerImage(
              imageUrl: "https://i.ibb.co/8r1Ny2n/20-Nike-Air-Force-1-07.png",
              height: size.height * 0.38,
              width: double.infinity,
              boxFit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    "Title" * 10,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: 15),
                Text(
                  "150\$",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                IconButton.filled(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                  ),
                  onPressed: () {},
                  icon: Icon(Icons.favorite, color: Colors.red),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[100],
                      iconColor: Colors.deepPurple,
                      foregroundColor: Colors.deepPurple,
                      iconSize: 25,
                      textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {},
                    label: Text("Add to cart"),
                    icon: Icon(Icons.add_shopping_cart),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "About this item",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "in phones",
                  style: TextStyle(fontSize: 18, color: Colors.grey[400]),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              "Description " * 50,
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
