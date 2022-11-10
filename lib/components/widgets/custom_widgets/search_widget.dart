import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../edited_widgets/sizedbox.dart';

Widget search_widget(TextEditingController ctrl,{bool isPage=false}){
  return Container(
      margin: EdgeInsets.only(left: 24.w),
      padding: const EdgeInsets.only(left: 12).r,
      height: 60.h,
      width: 280.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30).r,
          border: Border.all(color: Colors.grey)
      ),
      child: Center(
        child: Row(
          children:  [
            const Icon(Icons.search,color: Colors.grey,),
            sized(w: 8),
            SizedBox(
                width: 200.w,
                child:  isPage==true?
                TextField(
                  controller: ctrl,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search"
                  ),
                )
                    :const Text("Search",style: TextStyle(color: Colors.grey),))
          ],
        ),
      )
  );
}