import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:tech_shop_app/components/local_data/shop_baskett.dart';
import 'package:tech_shop_app/components/routes/routes.dart';
import 'package:tech_shop_app/components/widgets/buttons/navigate_button.dart';
import 'package:tech_shop_app/components/widgets/custom_widgets/product_in_basket_widget.dart';
import 'package:tech_shop_app/components/widgets/edited_widgets/mediaQuarees.dart';
import 'package:tech_shop_app/components/widgets/edited_widgets/text_widget.dart';
import 'package:tech_shop_app/utils/colors.dart';

import '../../components/local_data/database.dart';
import '../../components/widgets/edited_widgets/sizedbox.dart';
import '../../utils/project_images.dart';

class ShopBasketPage extends StatefulWidget {
  const ShopBasketPage({Key? key}) : super(key: key);

  @override
  State<ShopBasketPage> createState() => _ShopBasketPageState();
}

class _ShopBasketPageState extends State<ShopBasketPage> {
  @override
  Widget build(BuildContext context) {
    num getPrice(){
      num price=0;
      for(var i in shop_basket){
        price+=i.price*i.count;
      }
      return price;
    }
    return Scaffold(
      backgroundColor: AppColors.C_E5E5E5,
      body: StatefulBuilder(
        builder: (context, newsetstate) {
          return SafeArea(
            child: Container(
              padding: const EdgeInsets.all(24).r,
              height: m_h(context),
              width: m_w(context),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back)),
                      Text("Basket",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w600),),
                      IconButton(onPressed: (){}, icon: const Icon(Icons.delete)),
                    ],
                  ),
                  shop_basket.isEmpty?SafeArea(child: Center(child: Column(children:
                  [
                    Lottie.asset(Images.lt_nothing_here),
                    text("Your Basket is empty",clr: Colors.black,fontsize: 24,fontweight: FontWeight.w600)

                  ]
                  ),)):
                      Column(
                        children: [
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: shop_basket.length,
                              itemBuilder: (context, index) => Container(
                                margin: const EdgeInsets.only(bottom: 20).r,
                                padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 15).r,
                                height: 130.h,
                                width: 320.w,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10).r
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 100.h,
                                      width: 80.w,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(shop_basket.elementAt(index).main_image)
                                          )
                                      ),
                                    ),
                                    sized(w: 20),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        sized(h: 16),
                                        text(shop_basket.elementAt(index).title+shop_basket.elementAt(index).subtitle,
                                            clr: Colors.black,
                                            fontweight: FontWeight.w600
                                        ),
                                        sized(h: 8),
                                        text("\$ ${shop_basket.elementAt(index).price.toDouble()}",fontweight: FontWeight.w600),
                                        sized(h: 8),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Text("Quantity",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w300),),
                                            Container(
                                              margin: const EdgeInsets.only(left: 12).r,
                                              width: 70.w,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Container(
                                                    margin: const EdgeInsets.only(right: 6).r,
                                                    height: 20.h,
                                                    width: 20.h,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(4).r,
                                                      color: AppColors.C_7DCCEC,
                                                    ),
                                                    child:  Center(
                                                      child: InkWell(
                                                          onTap: (){
                                                            if(shop_basket.elementAt(index).count!=1){
                                                              shop_basket.elementAt(index).count--;
                                                            }
                                                            else{
                                                              shop_basket.remove(shop_basket.elementAt(index));
                                                            }
                                                            setState(() {});
                                                          },
                                                          child: const Text("-",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16),)),
                                                    ),
                                                  ),
                                                  Text(shop_basket.elementAt(index).count.toString()),
                                                  Container(
                                                    margin: const EdgeInsets.only(left: 6).r,
                                                    height: 20.h,
                                                    width: 20.h,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(4).r,
                                                      color: AppColors.C_7DCCEC,
                                                    ),
                                                    child: Center(
                                                      child: InkWell(
                                                          onTap: (){
                                                            setState(() {
                                                              shop_basket.elementAt(index).count++;
                                                            });
                                                          },
                                                          child: const Text("+",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16),)),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    )

                                  ],
                                ),
                              )
                          ),
                          Container(
                            padding: const EdgeInsets.all(12).r,
                            margin: const EdgeInsets.symmetric(vertical: 12).r,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                text("Total",clr: Colors.black,fontsize: 20),
                                text("\$ ${getPrice()}",fontweight: FontWeight.w600,fontsize: 20)
                              ],
                            ),
                          ),
                          buttonNavigate(text("Checkout",clr: Colors.white), RouteName.ch_out, context: context)
                        ],
                      )


                ],
              ),
            ),
          );
        },
      )
    );
  }
}
