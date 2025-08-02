import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerText extends StatelessWidget {
  const ShimmerText({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: Duration(seconds: 10),
      baseColor: Colors.purple,
      highlightColor: Colors.red,
      child: Text(
        "ShopSmart",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
