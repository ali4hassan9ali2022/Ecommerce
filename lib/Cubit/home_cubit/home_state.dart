import 'package:e_commerce/Models/products_models.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class LoadingHomeState extends HomeState {}

class SuccessHomeState extends HomeState {
  final List<ProductsModels> products;

  SuccessHomeState({required this.products});
}

class FailureHomeState extends HomeState {
  final String errMessage;

  FailureHomeState({required this.errMessage});
}
