import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_shop_app/pages/auth/forgotpassword_page.dart';
import 'package:tech_shop_app/pages/auth/login_page.dart';
import 'package:tech_shop_app/pages/auth/signup_page.dart';
import 'package:tech_shop_app/pages/home/favourites_page.dart';
import 'package:tech_shop_app/pages/description/info_page.dart';
import 'package:tech_shop_app/pages/home/main_page.dart';
import 'package:tech_shop_app/pages/home/search_page.dart';
import 'package:tech_shop_app/pages/home/shop_basket_page.dart';
import 'package:tech_shop_app/pages/purchase/check_uot_page.dart';
import 'package:tech_shop_app/pages/purchase/payment_page.dart';
import 'package:tech_shop_app/pages/splash_page.dart';

import '../../pages/home/home_page.dart';

class RouteName{
  static const splash="spl";
  static const login="lgn";
  static const suinup="sgnup";
  static const forgot="frgt";
  static const home="home";
  static const favourite="fvr";
  static const info="inf";
  static const search="srch";
  static const sh_basket="shpb";
  static const ch_out="chout";
  static const payment="pymnt";
  static const main='main';
}

class AppRoutes{
  static Route generateRoutes(RouteSettings settings){
    dynamic args=settings.arguments;
    switch (settings.name){
      case RouteName.splash: return MaterialPageRoute(builder: (_)=>const SplashPage());
      case RouteName.main: return MaterialPageRoute(builder: (_)=>const MainPage());
      case RouteName.favourite: return MaterialPageRoute(builder: (_)=>const FavouritesPage());
      case RouteName.info: return MaterialPageRoute(builder: (_)=> InformationPage(product: args));
      case RouteName.search: return MaterialPageRoute(builder: (_)=>const SearchPage());
      case RouteName.sh_basket: return MaterialPageRoute(builder: (_)=>const ShopBasketPage());
      case RouteName.ch_out: return MaterialPageRoute(builder: (_)=>const CheckOutPage());
      case RouteName.payment: return MaterialPageRoute(builder: (_)=>const PaymentPage());
      case RouteName.login: return MaterialPageRoute(builder: (_)=>const LoginPage());
      case RouteName.suinup: return MaterialPageRoute(builder: (_)=>const SignUp());
      case RouteName.forgot: return MaterialPageRoute(builder: (_)=>const ForgotPasswordPage());
      case RouteName.home: return MaterialPageRoute(builder: (_)=>const HomePage());
      default: return MaterialPageRoute(builder: (_)=>const Scaffold());

    }
  }
}