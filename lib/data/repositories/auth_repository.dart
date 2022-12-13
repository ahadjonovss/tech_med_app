import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tech_shop_app/components/local_data/shared_prefarence.dart';
import 'package:tech_shop_app/data/models/user_model.dart';

import '../../components/routes/routes.dart';

class AuthRepository {
  final FirebaseFirestore firebaseFirestore;
  AuthRepository({required this.firebaseFirestore});



  Future<void> signUp(context,UserModel user) async {
    var isHasUser = await firebaseFirestore.collection("users").where("email",isEqualTo: user.email).get();
    if(isHasUser.docs.isEmpty){
      DocumentReference docId =
      await firebaseFirestore.collection("users").add(user.toJson());
      await firebaseFirestore
          .collection("users")
          .doc(docId.id)
          .update({"userId": docId.id}).then((value) async {
         await StorageRepository.saveString("token", docId.id);
            Navigator.pushNamedAndRemoveUntil(context, RouteName.main, (route) => false);
            return true;
      }).onError((error, stackTrace) => false);
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Current email has already used")));
    }

  }

  Future<String> signIn(String email,String password) async {
    var user= await firebaseFirestore.collection("users").where("email",isEqualTo: email).get();
    if(user.docs.isEmpty){
      return "Account not found";
    }
    else if(user.docs[0]["password"]!=password){
      return "Incorrect Password";
    }else{
      return "Welcome";
    }


  }


}
