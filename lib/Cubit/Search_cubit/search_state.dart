import 'package:e_commerce/Models/products_models.dart';
abstract class SearchState {}

class SearchInitial extends SearchState {}

class LoadingSearchState extends SearchState {}

class SuccessSearchState extends SearchState {
  final List<ProductsModels> products;

  SuccessSearchState({required this.products});
}

class FailureSearchState extends SearchState {
  final String errMessage;

  FailureSearchState({required this.errMessage});
}
class LoadingAddProductToCartState extends SearchState{}
class SuccessAddProductToCartState extends SearchState{
  late final List<Map<String,dynamic>> productsInCart;
}
class FailureAddProductToCartState extends SearchState{
  final String errMessage;

  FailureAddProductToCartState({required this.errMessage});
}
