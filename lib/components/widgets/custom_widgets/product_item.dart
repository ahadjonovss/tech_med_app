import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_shop_app/components/routes/routes.dart';

import '../../../utils/project_images.dart';
import '../../models/product_model.dart';
import '../edited_widgets/text_widget.dart';

Widget product_item(Product product,BuildContext context,{bool isSearch=false}){
  return InkWell(
    onTap: (){
      Navigator.pushNamed(context, RouteName.info,arguments: product);
    },
    child: Container(
      margin: const EdgeInsets.only(right: 16).r,
      height: isSearch==true?260.h:300.h,
      width: isSearch==true?170.w:200.w,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            height: 60,
            width: isSearch==true?160.w:200.w,
          ),
          Container(
            margin: const EdgeInsets.only(top: 60).r,
            height: 240.h,
            width: isSearch==true?170.w:200.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20).r,
                color: Colors.white
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: text(product.title,
                      clr: Colors.black,
                      fontweight: FontWeight.w600,
                      fontsize: 22),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 50).r,
                  child: Align(
                      alignment: Alignment.center,
                      child: text(product.subtitle,
                          fontsize: 16,
                          fontweight: FontWeight.w600,
                          clr: Colors.grey
                      )),
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 120),
                    child: text("\$ ${product.price}",fontweight: FontWeight.w800),
                  ),
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment(0,-1),
              child: CircleAvatar(
                radius: isSearch==true?60:70,
                backgroundImage: NetworkImage(product.main_image),

              )),
        ],
      ),
    ),
  );
}
