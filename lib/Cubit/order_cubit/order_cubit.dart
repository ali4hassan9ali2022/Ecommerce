import 'dart:developer';

import 'package:e_commerce/Core/Database/Network/supabase_helper.dart';
import 'package:e_commerce/Cubit/order_cubit/order_state.dart';
import 'package:e_commerce/Models/order_model.dart';
import 'package:e_commerce/Widgets/toast_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitialState());
  Future<void> addProductToMyOrder({
    required List<Map<String, dynamic>> cartItems,
    required String userName,
  }) async {
    emit(LoadingOrderState());
    try {
      final user = SupabaseHelper.supabase.auth.currentUser;
      if (user == null) {
        emit(FailureOrderState(errMessage: "User not logged in"));
        return;
      }

      // جهّز كل الـ orders
      List<Map<String, dynamic>> ordersData = cartItems.map((item) {
        final product = item['products'];

        return OrderModel(
          orderId: const Uuid().v4(),
          userId: user.id,
          productId: product['productId'].toString(),
          productTitle: product['productTitle'].toString(),
          userName: userName,
          price: product['productPrice'].toString(),
          image: product['productImage'].toString(),
          quantity: item['quantity'].toString(),
          orderData: DateTime.now().toIso8601String(),
        ).toJson();
      }).toList();

      // ابعتهم دفعة واحدة
      await SupabaseHelper.supabase.from("orders").insert(ordersData);

      emit(SuccessOrderState());
      CustomToastWidget.showSuccessToast("Orders placed successfully");
      log("Orders inserted: ${ordersData.length}");
    } catch (e) {
      log(e.toString());
      CustomToastWidget.showErrorToast("Failed to add orders");
      emit(FailureOrderState(errMessage: e.toString()));
    }
  }

  Future<void> fetchOrders() async {
    emit(LoadingFetchOrderState());
    try {
      final user = SupabaseHelper.supabase.auth.currentUser;
      if (user == null) {
        emit(FailureFetchOrderState(errMessage: "User not logged in"));
        return;
      }

      final response = await SupabaseHelper.supabase
          .from("orders")
          .select()
          .eq("userId", user.id) // هات بس أوردرز اليوزر الحالي
          .order("orderData", ascending: false); // ترتبهم بالأحدث

      final orders = (response as List)
          .map((json) => OrderModel.formJson(json))
          .toList();

      emit(SuccessFetchOrderState(orders: orders));
      log("Fetched Orders: ${orders.length}");
    } catch (e) {
      log(e.toString());
      emit(FailureFetchOrderState(errMessage: e.toString()));
    }
  }
}
