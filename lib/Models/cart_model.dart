class CartModel {
  final String cartId;
  final String productId;
  final int quantity;

  CartModel({
    required this.cartId,
    required this.productId,
    required this.quantity,
  });

  factory CartModel.fromJson(json) {
    return CartModel(
      cartId: json["cartId"],
      productId: json["productId"],
      quantity: json["quantity"],
    );
  }
}
