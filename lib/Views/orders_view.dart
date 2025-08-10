import 'package:e_commerce/Widgets/custom_orders_widget.dart';
import 'package:flutter/material.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product orders")),
      body: ListView.separated(
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 2, vertical: 6),
          child: CustomOrdersWidget(),
        ),
        separatorBuilder: (context, index) => Divider(),
        itemCount: 15,
      ),
    );
  }
}
