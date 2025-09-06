import 'dart:developer';

import 'package:e_commerce/Core/Database/Local/supabase_helper.dart';
import 'package:e_commerce/Cubit/home_cubit/home_state.dart';
import 'package:e_commerce/Models/products_models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());
  List<ProductsModels> productsList = [];
  Future<void> fetchProducts() async {
    emit(LoadingHomeState());
    try {
      final response = await SupabaseHelper.supabase.from("products").select();
      productsList.clear();
      productsList = (response as List)
          .map((e) => ProductsModels.fromJson(e))
          .toList();
      log(productsList.length.toString());
      emit(SuccessHomeState(products: productsList));
    } catch (e) {
      emit(FailureHomeState(errMessage: e.toString()));
    }
  }
}
