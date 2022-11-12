import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_shop_app/components/local_data/shop_baskett.dart';
import 'package:tech_shop_app/components/widgets/custom_widgets/product_in_basket_widget.dart';
import 'package:tech_shop_app/components/widgets/edited_widgets/mediaQuarees.dart';
import 'package:tech_shop_app/components/widgets/edited_widgets/text_widget.dart';
import 'package:tech_shop_app/utils/colors.dart';

import '../../components/local_data/database.dart';

class ShopBasketPage extends StatefulWidget {
  const ShopBasketPage({Key? key}) : super(key: key);

  @override
  State<ShopBasketPage> createState() => _ShopBasketPageState();
}

class _ShopBasketPageState extends State<ShopBasketPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.C_E5E5E5,
      body: Container(
        padding: EdgeInsets.all(24).r,
        height: m_h(context),
        width: m_w(context),
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back)),
                  Text("Basket",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w600),),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.delete)),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: shop_basket.length,
                itemBuilder: (context, index) => productInBasket_widget(
                  product: shop_basket.elementAt(index),
                  setstatePage: (){setState(() {});},
                ),
            )


          ],
        ),
      ),
    );
  }
}
