import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_shop_app/components/routes/routes.dart';

import '../../../utils/project_images.dart';
import '../../models/product_model.dart';
import '../edited_widgets/text_widget.dart';

Widget product_item(Product product,BuildContext context){
  return InkWell(
    onTap: (){
      Navigator.pushNamed(context, RouteName.info,arguments: product);
    },
    child: Container(
      margin: const EdgeInsets.only(right: 16).r,
      height: 300.h,
      width: 200.w,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const SizedBox(
            height: 60,
            width: 200,
          ),
          Container(
            margin: const EdgeInsets.only(top: 60).r,
            height: 240.h,
            width: 200.w,
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
          Positioned(
            top: 10,
            left: 30,
              child: CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(product.main_image),

              )),
        ],
      ),
    ),
  );
}