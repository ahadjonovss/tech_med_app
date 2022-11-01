import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors.dart';
import '../../routes/routes.dart';

Widget buttonNavigate(Widget mytext,String navigate,{ required BuildContext context,Color clr=AppColors.C_5956E9,num h=70,num w=328}){
  return InkWell(
    onTap: (){
      Navigator.pushNamed(context,navigate);
    },
    child: Container(
      height: h.toDouble().h,
      width: w.toDouble().w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10).r,
        color: clr
      ),
      child: Center(child: mytext),
    ),
  );
}