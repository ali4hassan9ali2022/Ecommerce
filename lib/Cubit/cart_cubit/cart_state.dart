abstract class CartState {}
class CartInitial extends CartState{}
class LoadingAddProductToCartState extends CartState{}
class SuccessAddProductToCartState extends CartState{
  final String productId;

  SuccessAddProductToCartState({required this.productId});
}
class FailureAddProductToCartState extends CartState{
  final String errMessage;

  FailureAddProductToCartState({required this.errMessage});
}