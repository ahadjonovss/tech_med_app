class UserModel {
  String? userId;
  String name;
  String number;
  String email;
  String password;
  List orders;

  UserModel({
    required this.name,
    required this.number,
    required this.password,
    required this.email,
    required this.orders,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        name: json["name"]??"",
        number: json["number"]??"",
        password: json["password"]??"",
        email: json["email"]??"",
        orders: json["orders"]??[]);
  }

  Map toJson(){
    return {
      "userId":userId,
      "name":name,
      "password":password,
      "email":email,
      "orders":orders,
      "number":number
    };
  }


}
