import 'dart:io';

import 'package:e_commerce/Cubit/sign_up_cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';

class PickImageWidget extends StatelessWidget {
  const PickImageWidget({
    super.key,
    required this.signUpCubit,
    required this.fun,
  });
  final SignUpCubit signUpCubit;
  final Function fun;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(8),
          child: signUpCubit.imagePicker == null
              ? Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(),
                  ),
                )
              : Image.file(
                  File(signUpCubit.imagePicker!.path),
                  fit: BoxFit.fill,
                ),
        ),
        Positioned(
          right: -5,
          top: -5,
          child: Material(
            borderRadius: BorderRadius.circular(16.0),
            color: Colors.lightBlue,
            child: InkWell(
              splashColor: Colors.red,
              borderRadius: BorderRadius.circular(16.0),
              onTap: () {},
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.add_shopping_cart_rounded,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
