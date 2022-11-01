import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_shop_app/utils/colors.dart';

import '../edited_widgets/text_widget.dart';

Widget textfield({required dynamic icn,required String title,required hint}){
  return Container(
    child: Column(
      children: [
        Row(
          children: [
            Icon(icn,color: Colors.grey,),
            SizedBox(width: 12.w,),
            text(title,clr: Colors.grey)
          ],
        ),
        TextField(
          decoration: InputDecoration(
              hintText: hint,
          ),
        )
      ],
    ),
  );
}