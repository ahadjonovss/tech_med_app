import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_shop_app/components/routes/routes.dart';

import '../../../data/models/book_model.dart';
import '../../../utils/project_images.dart';
import '../../models/product_model.dart';
import '../edited_widgets/text_widget.dart';

Widget product_item(Book product,BuildContext context,{bool isSearch=false}){
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
                  child: text(product.name,
                      clr: Colors.black,
                      fontweight: FontWeight.w600,
                      fontsize: 16),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 50).r,
                  child: Align(
                      alignment: Alignment.center,
                      child: text(product.author,
                          fontsize: 12,
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
            height: 130,
            width: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(product.mainImage),
              )
            ),
            alignment: const Alignment(0,-1),
              ),
        ],
      ),
    ),
  );
}
