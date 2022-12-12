import 'package:flutter/material.dart';

import '../components/routes/routes.dart';
import '../data/repositories/auth_repository.dart';


class AuthViewModel {
  AuthRepository authRepository;

  AuthViewModel({required this.authRepository});

  signUp({required email, required password}) {
    return authRepository.signUp(email: email, password: password);
  }

  signIn(context, {required email, required password}) {
    try {
      authRepository.signIn(email: email, password: password);
      Navigator.pushNamedAndRemoveUntil(
          context, RouteName.main, (route) => false);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
