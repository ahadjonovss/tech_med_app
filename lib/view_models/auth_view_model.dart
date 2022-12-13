import 'package:flutter/material.dart';
import 'package:tech_shop_app/data/models/user_model.dart';

import '../components/routes/routes.dart';
import '../data/repositories/auth_repository.dart';


class AuthViewModel extends ChangeNotifier{
  AuthRepository authRepository;

  AuthViewModel({required this.authRepository});

  signUp({required context,required UserModel user}) {
    return authRepository.signUp(context,user);
  }

  signIn(context, {required email, required password}) async {
    try {
      var what= await authRepository.signIn(email, password);
      if(what=="Welcome"){
        Navigator.pushNamedAndRemoveUntil(
            context, RouteName.main, (route) => false);
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(what)));
      }


    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }


}
