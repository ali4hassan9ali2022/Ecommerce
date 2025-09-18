class OrderModel {
  final String orderId;
  final String userId;
  final String productId;
  final String productTitle;
  final String userName;
  final String price;
  final String image;
  final String quantity;
  final String orderData;

  OrderModel({
    required this.orderId,
    required this.userId,
    required this.productId,
    required this.productTitle,
    required this.userName,
    required this.price,
    required this.image,
    required this.quantity,
    required this.orderData,
  });
  factory OrderModel.formJson(json) {
    return OrderModel(
      orderId: json["orderId"],
      userId: json["userId"],
      productId: json["productId"],
      productTitle: json["productTitle"],
      userName: json["userName"],
      price: json["price"],
      image: json["image"],
      quantity: json["quantity"],
      orderData: json["orderData"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "orderId" : orderId,
      "userId" : userId,
      "productId" : productId,
      "productTitle" : productTitle,
      "userName": userName,
      "price" : price,
      "image": image,
      "quantity" : quantity,
      "orderData" : orderData,
    };
  }
} 
