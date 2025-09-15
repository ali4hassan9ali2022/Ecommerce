abstract class CartState {}

class CartInitial extends CartState {}

class LoadingAddProductToCartState extends CartState {}

class SuccessAddProductToCartState extends CartState {
  final String productId;

  SuccessAddProductToCartState({required this.productId});
}

class FailureAddProductToCartState extends CartState {
  final String errMessage;

  FailureAddProductToCartState({required this.errMessage});
}

class LoadingGetCartItemsState extends CartState {}

class SuccessGetCartItemsState extends CartState {
  final List<Map<String, dynamic>> cartItems;

  SuccessGetCartItemsState({required this.cartItems});
}

class FailureGetCartItemsState extends CartState {
  final String errMessage;

  FailureGetCartItemsState({required this.errMessage});
}
class LoadingClearCartState extends CartState {}
class SuccessClearCartState extends CartState {}
class FailureClearCartState extends CartState {
  final String errMessage;
  FailureClearCartState({required this.errMessage});
}
class LoadingRemoveProductFromCartState extends CartState {}
class SuccessRemoveProductFromCartState extends CartState {
  final String productId;
  SuccessRemoveProductFromCartState({required this.productId});
}
class FailureRemoveProductFromCartState extends CartState {
  final String errMessage;
  FailureRemoveProductFromCartState({required this.errMessage});
}