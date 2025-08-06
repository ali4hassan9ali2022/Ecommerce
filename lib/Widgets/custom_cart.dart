import 'package:e_commerce/Core/Utils/constants.dart';
import 'package:e_commerce/Widgets/quantity_bottom_sheet.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class CustomCart extends StatelessWidget {
  const CustomCart({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return FittedBox(
      child: IntrinsicWidth(
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: FancyShimmerImage(
                imageUrl: Constants.imageTestOne,
                width: size.height * 0.3,
                height: size.height * 0.3,
              ),
            ),
            SizedBox(width: 10),
            IntrinsicWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * 0.6,
                        child: Text(
                          "Title" * 10,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.clear, color: Colors.red),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.favorite, color: Colors.red),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "10\$",
                          style: TextStyle(fontSize: 20, color: Colors.blue),
                        ),
                        OutlinedButton.icon(
                          onPressed: () async {
                            await showModalBottomSheet(
                              backgroundColor: Theme.of(
                                context,
                              ).scaffoldBackgroundColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              context: context,
                              builder: (context) {
                                return QuantityBottomSheet();
                              },
                            );
                          },
                          label: Text("Oty: 6"),
                          icon: Icon(IconlyLight.arrowDown),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
