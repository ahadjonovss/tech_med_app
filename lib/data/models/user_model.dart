import 'package:tech_shop_app/data/models/order_model.dart';
import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.userId,
    required this.name,
    required this.number,
    required this.email,
    required this.password,
    required this.orders,
  });

  String userId;
  String name;
  String number;
  String email;
  String password;
  List orders;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    userId: json["userId"],
    name: json["name"],
    number: json["number"],
    email: json["email"],
    password: json["password"],
    orders:json["orders"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "name": name,
    "number": number,
    "email": email,
    "password": password,
    "orders": orders,
  };
}
