import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_shop_app/components/widgets/edited_widgets/sizedbox.dart';


import '../../components/widgets/edited_widgets/text_widget.dart';
import '../../utils/colors.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.C_E5E5E5,
      body: SafeArea(
        child:
        Container(
          padding: EdgeInsets.all(30).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sized(h: 32),
              text("My Profile",fontweight: FontWeight.w600,fontsize: 34,clr: Colors.black),
              Container(
                height: 168.h,
                width: 314.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20).r

                ),
                child: Stack(
                  children: [
                    Container(
                      alignment: Alignment(1,-1),
                      clipBehavior: Clip.none,
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,

                      ),
                    )
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
