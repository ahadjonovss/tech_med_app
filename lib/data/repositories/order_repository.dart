import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tech_shop_app/components/local_data/shared_prefarence.dart';
import 'package:tech_shop_app/data/models/order_model.dart';
import 'package:tech_shop_app/data/models/user_model.dart';

class OrderRepository{

  final FirebaseFirestore firebaseFirestore;
  OrderRepository({required this.firebaseFirestore});

  Future addOrder({required  String productId}) async {
    String uid= "0zMgEz9VeMwgSr8XISer";

    DocumentSnapshot<Map<String, dynamic>> user= await firebaseFirestore.collection("users").doc(uid).get();
    UserModel currentUser=UserModel.fromJson(user.data()??{});
    bool isHas=false;
    print(productId);
    for(OrderModel i in currentUser.orders){
      print(i);
      if(i.productId==productId){
        currentUser.orders.remove(i);
        i.count++;
        currentUser.orders.add(i);
        isHas=true;
      }
    }
    print("IsHas: $isHas");
    if(isHas==false){
      OrderModel order=OrderModel(productId: productId, count: 1, orderId: "");
      currentUser.orders.add(order);
    }
    await firebaseFirestore.collection("users").doc(uid).update(currentUser.toJson());
  }

  // Future<Book> getProductByDocId(String docId) async {
  //   var data = await firebaseFirestore.collection("products").doc(docId).get();
  //   return Book.fromJson(data.data() as Map<String, dynamic>);
  // }
  //
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
  // Future<void> updateCategory({required Book book,required String docId}) async {
  //   try{
  //     // ignore: avoid_print
  //     await firebaseFirestore.collection("categories").doc(docId).update(book.toJson()).then((value) => print("Updated to ${book.name}"));
  //   }on FirebaseException catch(e){
  //     if (kDebugMode) {
  //       print("Error: ${e.toString()}");
  //     }
  //
  //   }
  // }
}