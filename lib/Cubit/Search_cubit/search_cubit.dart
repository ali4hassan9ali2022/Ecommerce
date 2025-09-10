import 'dart:developer';

import 'package:e_commerce/Core/Database/Local/supabase_helper.dart';
import 'package:e_commerce/Cubit/Search_cubit/search_state.dart';
import 'package:e_commerce/Models/products_models.dart';
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
}
