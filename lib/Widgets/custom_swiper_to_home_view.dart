import 'package:card_swiper/card_swiper.dart';
import 'package:e_commerce/Core/Helper/app_helper.dart';
import 'package:flutter/material.dart';

class CustomSwiperToHomeView extends StatelessWidget {
  const CustomSwiperToHomeView({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.20,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Image.asset(AppHelper.images[index], fit: BoxFit.fill);
          },
          itemCount: AppHelper.images.length,
          autoplay: true,
          pagination: SwiperPagination(),
          control: SwiperControl(),
        ),
      ),
    );
  }
}