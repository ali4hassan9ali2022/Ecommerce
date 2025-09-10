abstract class CartState {}
class CartInitial extends CartState{}
class LoadingAddProductToCartState extends CartState{}
class SuccessAddProductToCartState extends CartState{
  // late final List<Map<String,dynamic>> productsInCart;
}
class FailureAddProductToCartState extends CartState{
  final String errMessage;

  FailureAddProductToCartState({required this.errMessage});
}