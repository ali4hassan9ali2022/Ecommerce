import 'dart:developer';

import 'package:e_commerce/Core/Database/Local/supabase_helper.dart';
import 'package:e_commerce/Cubit/Search_cubit/search_state.dart';
import 'package:e_commerce/Models/products_models.dart';
import 'package:e_commerce/Widgets/toast_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  TextEditingController searchController = TextEditingController();
  //! Fetch Products
  List<ProductsModels> productsList = [];
  Future<void> fetchProducts() async {
    emit(LoadingSearchState());
    try {
      final response = await SupabaseHelper.supabase.from("products").select();
      productsList.clear();
      productsList = (response as List)
          .map((e) => ProductsModels.fromJson(e))
          .toList();
      log(productsList.length.toString());
      emit(SuccessSearchState(products: productsList));
    } catch (e) {
      emit(FailureSearchState(errMessage: e.toString()));
    }
  }

  //! Add product to cart
  Future<void> addProductToMyCart({
    required String productId,
    required int quantity,
  }) async {
    emit(LoadingAddProductToCartState());

    final user = SupabaseHelper.supabase.auth.currentUser;
    if (user == null) {
      emit(FailureAddProductToCartState(errMessage: "User not found"));
      CustomToastWidget.showWarningToast("User not found");
      return;
    }

    try {
      // 1. جيب الـ userCart الحالي
      final response = await SupabaseHelper.supabase
          .from("users")
          .select("userCart")
          .eq("id", user.id)
          .single();

      List<dynamic> currentCart = response["userCart"] ?? [];

      // 2. شوف المنتج موجود ولا لأ
      int index = currentCart.indexWhere(
        (item) => item["productId"] == productId,
      );

      if (index != -1) {
        // لو موجود، نزود الكمية
        currentCart[index]["quantity"] =
            (currentCart[index]["quantity"] ?? 0) + quantity;
      } else {
        // لو مش موجود، نضيفه جديد
        currentCart.add({"productId": productId, "quantity": quantity});
      }

      // 3. اعمل update للـ userCart
      await SupabaseHelper.supabase
          .from("users")
          .update({"userCart": currentCart})
          .eq("id", user.id);

      CustomToastWidget.showSuccessToast("Product added to cart");
      emit(SuccessAddProductToCartState());
    } catch (e) {
      emit(FailureAddProductToCartState(errMessage: e.toString()));
    }
  }
}
