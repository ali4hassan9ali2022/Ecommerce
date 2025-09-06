class ProductsModels {
  final String productId;
  final String productTitle;
  final String productPrice;
  final String productDescription;
  final String productImage;
  final String productQuantity;

  ProductsModels({
    required this.productId,
    required this.productTitle,
    required this.productPrice,
    required this.productDescription,
    required this.productImage,
    required this.productQuantity,
  });
  factory ProductsModels.fromJson(json) {
    return ProductsModels(
      productId: json["productId"] ?? "",
      productTitle: json["productTitle"] ?? "",
      productPrice: json["productPrice"] ?? "",
      productDescription: json["productDescription"] ?? "",
      productImage: json["productImage"] ?? "",
      productQuantity: json["productQuantity"] ?? "",
    );
  }
}
