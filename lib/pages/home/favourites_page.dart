import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:tech_shop_app/components/local_data/database.dart';
import 'package:tech_shop_app/components/models/product_model.dart';
import 'package:tech_shop_app/components/widgets/custom_widgets/product_in_basket_widget.dart';
import 'package:tech_shop_app/components/widgets/edited_widgets/mediaQuarees.dart';
import 'package:tech_shop_app/components/widgets/edited_widgets/sizedbox.dart';
import 'package:tech_shop_app/utils/colors.dart';

import '../../components/widgets/edited_widgets/text_widget.dart';
import '../../utils/project_images.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({Key? key}) : super(key: key);

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  @override
  Widget build(BuildContext context) {
      List<Product> favs=[];
      for(var i in all_product){
        for (var j in i){
          if(j.isLiked==true){
            favs.add(j);
          }
        }
      }

    return Scaffold(
      backgroundColor: AppColors.C_E5E5E5,
      appBar: AppBar(
        title: const Text("Favourites",style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: favs.length==0?Column(
          children: [
            sized(h: 70),
            Lottie.asset(Images.lt_empty),
            text("You have no favourites yet",clr: Colors.black,fontsize: 20,fontweight: FontWeight.w600)
          ],
        ):Container(
          padding: const EdgeInsets.all(24).r,
          height: m_h(context),
          width: m_w(context),
          // child: ListView.builder(
          //   physics: const BouncingScrollPhysics(),
          //   itemCount: favs.length,
          //     itemBuilder: (context, index) {
          //       return productInBasket_widget(product: favs[index], setstatePage: () { setState(() {}); },);
          //     },)
        ),
      ),
    );
  }
}
