import 'package:e_commerce/Cubit/order_cubit/order_cubit.dart';
import 'package:e_commerce/Cubit/order_cubit/order_state.dart';
import 'package:e_commerce/Widgets/custom_orders_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersView extends StatefulWidget {
  const OrdersView({super.key});

  @override
  State<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() {
    BlocProvider.of<OrderCubit>(context).fetchOrders();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      // listener: (context, state) {
      //   if (state is SuccessFetchOrderState) {
      //     CustomToastWidget.showSuccessToast("Done");
      //   } else if (state is FailureFetchOrderState) {
      //     CustomToastWidget.showErrorToast("Orders not foound");
      //   }
      // },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: state is SuccessFetchOrderState
                ? Text("${state.orders.length} Product orders")
                : Text("Product orders"),
          ),
          body: state is SuccessFetchOrderState
              ? ListView.separated(
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsetsGeometry.symmetric(
                      horizontal: 2,
                      vertical: 6,
                    ),
                    child: CustomOrdersWidget(orders: state.orders[index]),
                  ),
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: state.orders.length,
                )
              : state is LoadingFetchOrderState
              ? Center(child: CircularProgressIndicator())
              : state is FailureFetchOrderState
              ? Center(child: Text("Orders not found"))
              : Center(child: Text("Error")),
        );
      },
    );
  }
}
