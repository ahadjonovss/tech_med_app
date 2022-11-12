import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_shop_app/components/local_data/shop_baskett.dart';
import 'package:tech_shop_app/components/routes/routes.dart';
import 'package:tech_shop_app/components/widgets/edited_widgets/sizedbox.dart';
import 'package:tech_shop_app/components/widgets/edited_widgets/text_widget.dart';
import 'package:tech_shop_app/utils/colors.dart';

import '../../models/product_model.dart';

class productInBasket_widget extends StatefulWidget {
  VoidCallback setstatePage;
  Product product;
   productInBasket_widget({required this.setstatePage,required this.product,Key? key}) : super(key: key);

  @override
  State<productInBasket_widget> createState() => _productInBasket_widgetState();
}

class _productInBasket_widgetState extends State<productInBasket_widget> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                image: NetworkImage(widget.product.main_image)
              )
            ),
          ),
          sized(w: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sized(h: 16),
              text(widget.product.title+widget.product.subtitle,
                  clr: Colors.black,
                fontweight: FontWeight.w600
              ),
              sized(h: 8),
              text("\$ ${widget.product.price.toDouble()}",fontweight: FontWeight.w600),
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
                                if(widget.product.count!=1){
                                  widget.product.count--;
                                }
                                else{
                                  shop_basket.remove(widget.product);
                                  widget.setstatePage;
                                }
                                widget.setstatePage;
                                setState(() {});
                              },
                                child: const Text("-",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16),)),
                          ),
                        ),
                        Text(widget.product.count.toString()),
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
                                  widget.product.count++;
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
    );
  }
}
