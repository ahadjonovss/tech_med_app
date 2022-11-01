import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget text(dynamic text,{int fontsize=17,FontWeight fontweight=FontWeight.w400,Color clr=Colors.white}){
  return Text(text.toString(),style: TextStyle(
    fontSize: fontsize.sp,
    fontWeight: fontweight,
    color: clr,
  ),);
}