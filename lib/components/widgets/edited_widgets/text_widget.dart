import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_shop_app/utils/colors.dart';

Widget text(dynamic text,{int fontsize=17,FontWeight fontweight=FontWeight.w400,Color clr=AppColors.C_5956E9}){
  return Text(text.toString(),style: TextStyle(
    fontSize: fontsize.sp,
    fontWeight: fontweight,
    color: clr,
  ),);
}