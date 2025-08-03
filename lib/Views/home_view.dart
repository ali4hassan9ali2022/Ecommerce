import 'package:e_commerce/Widgets/custom_swiper_to_home_view.dart';
import 'package:e_commerce/Widgets/latest_arrivals.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomSwiperToHomeView(size: size),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            "Latest arrivals",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 30),
        SizedBox(
          height: size.height * 0.2,

          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return LatestArrivals();
            },
          ),
        ),
      ],
    );
  }
}
