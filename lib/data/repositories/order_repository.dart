import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:tech_shop_app/components/local_data/shared_prefarence.dart';
import 'package:tech_shop_app/data/models/order_model.dart';
import 'package:tech_shop_app/data/models/user_model.dart';
import 'package:tech_shop_app/view_models/products_view_model.dart';

import '../models/book_model.dart';

class OrderRepository{

  final FirebaseFirestore firebaseFirestore;
  OrderRepository({required this.firebaseFirestore});

  Future addOrder({required  String productId}) async {
    String uid= "0zMgEz9VeMwgSr8XISer";

    DocumentSnapshot<Map<String, dynamic>> user= await firebaseFirestore.collection("users").doc(uid).get();
    UserModel currentUser=UserModel.fromJson(user.data()??{});
    bool isHas=false;
    for(String i in currentUser.orders){
      OrderModel order= await getOrderByDocId(i);
      if(order.productId==productId){
        OrderModel currentOrder= await getOrderByDocId(order.orderId);
        await UpdateCountOfOrder( orderId: i, son: (currentOrder.count+1));
        isHas=true;
      }
    }
    if(isHas==false){
      OrderModel order=OrderModel(productId: productId, count: 1, orderId: "");
      DocumentReference docId =
      await firebaseFirestore.collection("orders").add(order.toJson());
      await firebaseFirestore
          .collection("orders")
          .doc(docId.id)
          .update({"orderId": docId.id});

      currentUser.orders.add(docId.id);
    }
    await firebaseFirestore.collection("users").doc(uid).update(currentUser.toJson());
  }

  Future<OrderModel> getOrderByDocId(String docId) async {
    var data = await firebaseFirestore.collection("orders").doc(docId).get();
    print("Dh2IgYHV3VJEMVsp3y3P chiqishi kere");
    print(docId);
    OrderModel order=OrderModel.fromJson(data.data() as Map<String,dynamic>);
    return order;

  }

  Stream<UserModel> listenUser() {
    String uid= "0zMgEz9VeMwgSr8XISer";
    return firebaseFirestore.collection("users").where("userId",isEqualTo: uid).snapshots().map(
            (event) => event.docs.map((e) => UserModel.fromJson(e.data())).toList()[0]);
  }
  //
  // Future<void> deleteProductByDocId({required String docId}) async {
  //   try{
  //     await firebaseFirestore.collection("products").doc(docId).delete();
  //   }on FirebaseException catch(e){
  //     if (kDebugMode) {
  //       print("Error bo'ldi : ${e.toString()}");
  //     }
  //   }
  // }
  //
  Future<void> UpdateCountOfOrder({bool isPlus=true,required String orderId,required son}) async {
    try{
      // ignore: avoid_print
      await firebaseFirestore.collection("orders").doc(orderId).update({"count":son }).then((value) => print("Updated to "));
    }on FirebaseException catch(e){
      if (kDebugMode) {
        print("Error: ${e.toString()}");
      }

    }
  }

  Future<List> getProductIdByOrderId(context,String orderId) async {
    var order= await firebaseFirestore.collection("orders").doc(orderId).get();
    OrderModel orderModel=OrderModel.fromJson(order.data() as Map<String,dynamic>);
    List results=[];
    results.add(orderModel);
    var result= await Provider.of<ProductsViewModel>(context,listen: false).getProductById(order.data()!["productId"]);
    results.add(result);
    return results;


  }
}