import 'dart:developer';

import 'package:e_commerce/Core/Database/Local/supabase_helper.dart';
import 'package:e_commerce/Cubit/favorite_cubit/favorite_state.dart';
import 'package:e_commerce/Widgets/toast_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  final List<String> _favoriteProductIds = [];

  List<String> get favoriteProductIds => _favoriteProductIds;
  Future<void> loadFavorites() async {
    try {
      final user = SupabaseHelper.supabase.auth.currentUser;
      if (user == null) return;

      final response = await SupabaseHelper.supabase
          .from("favorite")
          .select("productId")
          .eq("userId", user.id);

      _favoriteProductIds.clear();
      _favoriteProductIds.addAll(
        (response as List).map((e) => e["productId"].toString()),
      );

      emit(LoadingAddProductToFavoriteState(productId: _favoriteProductIds));
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> toggleFavorite({required String productId}) async {
    try {
      final user = SupabaseHelper.supabase.auth.currentUser;
      if (user == null) {
        emit(
          FailureAddProductToFavoriteState(errMessage: "User not logged in"),
        );
        return;
      }

      final isCurrentlyFavorite = _favoriteProductIds.contains(productId);
      if (isCurrentlyFavorite) {
        await SupabaseHelper.supabase
            .from("favorite")
            .delete()
            .eq('userId', user.id)
            .eq('productId', productId);

        _favoriteProductIds.remove(productId);
        emit(SuccessRemoveProductFromFavoriteState(productId: productId));
        CustomToastWidget.showSuccessToast("Delete Done");
        log("Product removed from favorite.");
      } else {
        await SupabaseHelper.supabase.from("favorite").insert({
          'userId': user.id,
          'productId': productId,
        });

        _favoriteProductIds.add(productId);
        emit(SuccessAddProductToFavoriteState(productId: productId));
        CustomToastWidget.showSuccessToast("Product added to Favorite");
        log("Product added to favorite.");
      }
    } catch (e) {
      log(e.toString());
      emit(FailureAddProductToFavoriteState(errMessage: e.toString()));
    }
  }
}
