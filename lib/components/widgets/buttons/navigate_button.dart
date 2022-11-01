import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors.dart';

Widget buttonNavigate(Widget mytext,String navigate,{Color clr=AppColors.C_5956E9,num h=70,num w=400}){
  return Container(
    height: h.toDouble().h,
    width: w.toDouble().w,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10).r
    ),
    child: Center(child: mytext),


  );
}