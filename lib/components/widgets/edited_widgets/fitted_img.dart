import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget fitted_img({int h=0,int w=0, required String img}){
  return Container(
    height: h.toDouble().h,
    width: w.toDouble().w,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(img),
        fit: BoxFit.cover
      )
    ),

  );
}
