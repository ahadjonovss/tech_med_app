class OrderModel {
  String? orderId;
  int count;
  String productId;

  OrderModel(
      {required this.productId, required this.count, required this.orderId});

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      productId: json["productId"] ?? "",
      count: json["count"] ?? "",
      orderId: json["orderId"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {"orderId": orderId, "count": count, "productId": productId};
  }
}
