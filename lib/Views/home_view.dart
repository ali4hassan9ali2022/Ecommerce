import 'package:e_commerce/Widgets/custom_swiper_to_home_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(children: [CustomSwiperToHomeView(size: size)]);
  }
}
