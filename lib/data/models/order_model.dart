class OrderModel {
  OrderModel({
    required this.orderId,
    required this.count,
    required this.productId,
  });

  String orderId;
  int count;
  String productId;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    orderId: json["orderId"],
    count: json["count"],
    productId: json["productId"],
  );

  Map<String, dynamic> toJson() => {
    "orderId": orderId,
    "count": count,
    "productId": productId,
  };
}
