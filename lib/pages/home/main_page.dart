import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:tech_shop_app/pages/home/favourites_page.dart';
import 'package:tech_shop_app/pages/home/home_page.dart';
import 'package:tech_shop_app/pages/home/shop_basket_page.dart';
import 'package:tech_shop_app/utils/colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}
List pages=[
  HomePage(),
  FavouritesPage(),
  ShopBasketPage(),
  Container()
];

class _MainPageState extends State<MainPage> {
  int c_page=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.C_E5E5E5,
      drawer: const Drawer(),
      body:pages[c_page] ,
      bottomNavigationBar:  DotNavigationBar(
        currentIndex: c_page,
        onTap: (p0) {
          setState(() {
            c_page=p0;
          });
        },
        // dotIndicatorColor: Colors.black,
        items: [
          /// Home
          DotNavigationBarItem(
            icon: Icon(Icons.home),
            selectedColor: Colors.purple,
          ),

          /// Likes
          DotNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            selectedColor: Colors.purple,
          ),

          /// basket
          DotNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            selectedColor: Colors.purple,
          ),

          /// Profile
          DotNavigationBarItem(
            icon: Icon(Icons.person),
            selectedColor: Colors.purple,
          ),

        ],
      ),
    );
  }
}
