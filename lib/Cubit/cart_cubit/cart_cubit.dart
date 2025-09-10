import 'package:e_commerce/Core/Database/Local/supabase_helper.dart';
import 'package:e_commerce/Cubit/cart_cubit/cart_state.dart';
import 'package:e_commerce/Widgets/toast_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  //! Add product to cart
  Future<void> addProductToMyCart({
    required String productId,
    required int quantity,
  }) async {
    emit(LoadingAddProductToCartState());

    final user = SupabaseHelper.supabase.auth.currentUser;
    final cartId = const Uuid().v4();
    if (user == null) {
      emit(FailureAddProductToCartState(errMessage: "User not found"));
      CustomToastWidget.showWarningToast("User not found");
      return;
    }

    try {
      final response = await SupabaseHelper.supabase
          .from("users")
          .select("userCart")
          .eq("id", user.id)
          .single();

      List<dynamic> currentCart = response["userCart"] ?? [];
      int index = currentCart.indexWhere(
        (item) => item["productId"] == productId,
      );

      if (index != -1) {
        currentCart[index]["quantity"] =
            (currentCart[index]["quantity"] ?? 0) + quantity;
      } else {
        currentCart.add({
          "cartId": cartId,
          "productId": productId,
          "quantity": quantity,
        });
      }
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
