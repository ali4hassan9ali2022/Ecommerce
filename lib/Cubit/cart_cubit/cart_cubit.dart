import 'dart:developer';

import 'package:e_commerce/Core/Database/Local/supabase_helper.dart';
import 'package:e_commerce/Cubit/cart_cubit/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  //! Add product to cart
  Future<void> addProductToMyCart({
    required String productId, // معرف المنتج  // معرف المستخدم
  }) async {
    emit(LoadingAddProductToCartState());
    try {
      final user = SupabaseHelper.supabase.auth.currentUser;
      if (user == null) {
        emit(FailureAddProductToCartState(errMessage: "User not logged in"));
        return;
      }

      // 1. التحقق من وجود المنتج في سلة المستخدم
      final List<Map<String, dynamic>> existingItems = await SupabaseHelper
          .supabase
          .from("cart")
          .select()
          .eq('userId', user.id)
          .eq('productId', productId);

      if (existingItems.isNotEmpty) {
        // 2. إذا كان موجودًا، قم بتحديث الكمية بزيادة 1
        final int currentQuantity = existingItems.first['quantity'] as int;
        await SupabaseHelper.supabase
            .from("cart")
            .update({'quantity': currentQuantity + 1})
            .eq('userId', user.id)
            .eq('productId', productId);

        emit(SuccessAddProductToCartState(productId: productId));
        log("Product quantity updated in cart.");
      } else {
        // 3. إذا لم يكن موجودًا، قم بإضافة صف جديد
        await SupabaseHelper.supabase.from("cart").insert({
          'userId': user.id,
          'productId': productId,
          'quantity': 1,
          // يمكنك تغيير هذا حسب حاجتك
        });

        emit(SuccessAddProductToCartState(productId: productId));
        log("Product added to cart.");
      }
    } catch (e) {
      emit(FailureAddProductToCartState(errMessage: e.toString()));
      log(e.toString());
    }
  }

  //! Fetch Cart items
  Future<void> getCartItems() async {
    emit(LoadingGetCartItemsState());
    try {
      final user = SupabaseHelper.supabase.auth.currentUser;
      if (user == null) {
        emit(FailureGetCartItemsState(errMessage: "User not logged in"));
        return;
      }

      final List<Map<String, dynamic>> response = await SupabaseHelper.supabase
          .from("cart")
          .select(
            '*, products(productId, productTitle, productPrice, productImage, productCategory, productDescription)',
          )
          .eq('userId', user.id);

      emit(SuccessGetCartItemsState(cartItems: response));
      log("Cart items fetched successfully.");
    } catch (e) {
      log(e.toString());
      emit(FailureGetCartItemsState(errMessage: e.toString()));
    }
  }

  //! Clear Cart
  Future<void> clearCart() async {
    emit(LoadingClearCartState());
    try {
      final user = SupabaseHelper.supabase.auth.currentUser;
      if (user == null) {
        emit(FailureClearCartState(errMessage: "User not logged in"));
        return;
      }

      await SupabaseHelper.supabase.from("cart").delete().eq('userId', user.id);

      emit(SuccessClearCartState());
      log("Cart cleared successfully.");
    } catch (e) {
      log(e.toString());
      emit(FailureClearCartState(errMessage: e.toString()));
    }
  }

  //! Delete Product from cart
  Future<void> removeProductFromCart({required String productId}) async {
    try {
      final user = SupabaseHelper.supabase.auth.currentUser;
      if (user == null) {
        emit(
          FailureRemoveProductFromCartState(errMessage: "User not logged in"),
        );
        return;
      }

      await SupabaseHelper.supabase
          .from("cart")
          .delete()
          .eq('userId', user.id)
          .eq('productId', productId);

      emit(SuccessRemoveProductFromCartState(productId: productId));

      log("Product removed from cart successfully: $productId");
    } catch (e) {
      log(e.toString());
      emit(FailureRemoveProductFromCartState(errMessage: e.toString()));
    }
  }
}
