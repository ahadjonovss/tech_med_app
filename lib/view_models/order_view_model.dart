import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:tech_shop_app/data/models/order_model.dart';
import 'package:tech_shop_app/data/models/user_model.dart';
import 'package:tech_shop_app/data/repositories/order_repository.dart';

class OrderViewModel extends ChangeNotifier{
  FirebaseFirestore firebaseFirestore;

  OrderViewModel({required this.firebaseFirestore});

  OrderRepository orderRepository=OrderRepository(firebaseFirestore: FirebaseFirestore.instance);

  Stream<UserModel>listenUser() => orderRepository.listenUser();

  addOrder(String productId)=>orderRepository.addOrder(productId: productId);


}