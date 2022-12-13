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
    orderId: json["orderId"]??"no name",
    count: json["count"]??0,
    productId: json["productId"]??"no data",
  );

  Map<String, dynamic> toJson() => {
    "orderId": orderId,
    "count": count,
    "productId": productId,
  };
}
