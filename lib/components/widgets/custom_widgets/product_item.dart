import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/project_images.dart';
import '../edited_widgets/text_widget.dart';

Widget product_item(){
  return Container(
    margin: EdgeInsets.only(right: 16).r,
    height: 300.h,
    width: 200.w,
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 60,
          width: 200,
        ),
        Container(
          margin: EdgeInsets.only(top: 60).r,
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
                child: text("Apple Watch",
                    clr: Colors.black,
                    fontweight: FontWeight.w600,
                    fontsize: 22),
              ),
              Container(
                margin: const EdgeInsets.only(top: 50).r,
                child: Align(
                    alignment: Alignment.center,
                    child: text("Series 6 . Red",
                        fontsize: 16,
                        fontweight: FontWeight.w600,
                        clr: Colors.grey
                    )),
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 120),
                  child: text("\$ 369",fontweight: FontWeight.w800),
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
              backgroundImage: NetworkImage("https://avatars.mds.yandex.net/i?id=22af0134e5f01e8da6b336ee56105e9da58d56d8-4558237-images-thumbs&n=13"),
              
            )),
      ],
    ),
  );
}
