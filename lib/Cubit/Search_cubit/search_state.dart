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
