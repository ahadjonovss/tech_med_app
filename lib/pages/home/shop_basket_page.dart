import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:tech_shop_app/components/local_data/shop_baskett.dart';
import 'package:tech_shop_app/components/models/product_model.dart';
import 'package:tech_shop_app/components/routes/routes.dart';
import 'package:tech_shop_app/components/widgets/buttons/navigate_button.dart';
import 'package:tech_shop_app/components/widgets/edited_widgets/mediaQuarees.dart';
import 'package:tech_shop_app/components/widgets/edited_widgets/text_widget.dart';
import 'package:tech_shop_app/data/models/order_model.dart';
import 'package:tech_shop_app/data/models/user_model.dart';
import 'package:tech_shop_app/pages/home/widgets/cart_item.dart';
import 'package:tech_shop_app/utils/colors.dart';
import 'package:tech_shop_app/view_models/order_view_model.dart';
import 'package:tech_shop_app/view_models/products_view_model.dart';

import '../../components/widgets/edited_widgets/sizedbox.dart';
import '../../data/models/book_model.dart';

class ShopBasketPage extends StatefulWidget {
  const ShopBasketPage({Key? key}) : super(key: key);

  @override
  State<ShopBasketPage> createState() => _ShopBasketPageState();
}

class _ShopBasketPageState extends State<ShopBasketPage> {
  @override
  Widget build(BuildContext context) {
    num getPrice() {
      num price = 0;
      // for (var i in shop_basket) {
      //   price += i.price * i.count;
      // }
      return price;
    }

    return Scaffold(
        backgroundColor: AppColors.C_E5E5E5,
        appBar: AppBar(
          title: const Text(
            "Basket",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: SingleChildScrollView(
          child: StatefulBuilder(
            builder: (context, newsetstate) {
              return SafeArea(
                child: Container(
                  padding: const EdgeInsets.all(24).r,
                  width: m_w(context),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        StreamBuilder(
                          stream: context.read<OrderViewModel>().listenUser(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              UserModel user = snapshot.data!;
                              return SizedBox(
                                  width: m_w(context),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: user.orders.length,
                                    itemBuilder: (context, index) {
                                      print(user.orders[0]);
                                      return CartItem(order: user.orders.elementAt(index),);
                                    },
                                  ));
                            }
                            if (snapshot.hasError) {
                              print(snapshot.error.toString());
                            }
                            return Container();
                          },
                        ),
                        Container(
                          padding: const EdgeInsets.all(16).r,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              text("Total", clr: Colors.black, fontsize: 20),
                              text("\$ ${getPrice()}",
                                  fontweight: FontWeight.w600, fontsize: 20)
                            ],
                          ),
                        ),
                        buttonNavigate(text("Checkout", clr: Colors.white),
                            RouteName.ch_out,
                            context: context)
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }
}
//
// Widget some(){
//   return

// }

// SafeArea(
// child: Center(
// child: Column(children: [
// sized(h: 70),
// Lottie.asset(Images.lt_nothing_here),
// text("Your Basket is empty",
// clr: Colors.black,
// fontsize: 24,
// fontweight: FontWeight.w600)
// ]),
// ))
