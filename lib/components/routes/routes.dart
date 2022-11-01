import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_shop_app/pages/auth/forgotpassword_page.dart';
import 'package:tech_shop_app/pages/auth/login_page.dart';
import 'package:tech_shop_app/pages/auth/signup_page.dart';
import 'package:tech_shop_app/pages/home/home_page.dart';
import 'package:tech_shop_app/pages/splash_page.dart';

class RouteName{
  static const splash="spl";
  static const login="lgn";
  static const suinup="sgnup";
  static const forgot="frgt";
  static const home="home";
}

class AppRoutes{
  static Route generateRoutes(RouteSettings settings){
    switch (settings.name){
      case RouteName.splash: return MaterialPageRoute(builder: (_)=>SplashPage());
      case RouteName.login: return MaterialPageRoute(builder: (_)=>LoginPage());
      case RouteName.suinup: return MaterialPageRoute(builder: (_)=>SignUp());
      case RouteName.forgot: return MaterialPageRoute(builder: (_)=>ForgotPasswordPage());
      case RouteName.home: return MaterialPageRoute(builder: (_)=>HomePage());
      default: return MaterialPageRoute(builder: (_)=>Scaffold());

    }
  }
}