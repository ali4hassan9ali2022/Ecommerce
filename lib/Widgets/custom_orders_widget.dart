import 'package:e_commerce/Core/Utils/constants.dart';
import 'package:e_commerce/Models/order_model.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class CustomOrdersWidget extends StatelessWidget {
  const CustomOrdersWidget({super.key, required this.orders});
  final OrderModel orders;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: FancyShimmerImage(
              height: size.width * 0.25,
              width: size.width * 0.25,
              imageUrl: orders.image ?? Constants.imageTestOne,
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Flexible(
                        child: Text(
                          orders.productTitle,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.clear,
                          color: Colors.red,
                          size: 22,
                        ),
                      ),
                    ],
                  ),
                   Row(
                    children: [
                      Text('Price:  ', style: TextStyle(fontSize: 15)),
                      Flexible(
                        child: Text(
                          "${orders.price} \$",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text("Qty: ${orders.quantity}", style: TextStyle(fontSize: 15)),
                  // const Row(
                  //   children: [
                  //     Flexible(
                  //       child: TitlesTextWidget(
                  //         label: 'Qty:  ',
                  //         fontSize: 15,
                  //       ),
                  //     ),
                  //     Flexible(
                  //       child: SubtitleTextWidget(
                  //         label: "10",
                  //         fontSize: 15,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
