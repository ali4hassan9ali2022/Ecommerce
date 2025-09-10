import 'package:e_commerce/Core/Database/Local/supabase_helper.dart';
import 'package:e_commerce/Cubit/cart_cubit/cart_state.dart';
import 'package:e_commerce/Widgets/toast_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
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

      emit(SuccessAddProductToCartState(productId: productId));
    } catch (e) {
      emit(FailureAddProductToCartState(errMessage: e.toString()));
    }
  }
}
