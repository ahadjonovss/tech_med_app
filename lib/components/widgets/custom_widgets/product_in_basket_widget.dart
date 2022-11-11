import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_shop_app/components/widgets/edited_widgets/sizedbox.dart';
import 'package:tech_shop_app/components/widgets/edited_widgets/text_widget.dart';
import 'package:tech_shop_app/utils/colors.dart';

class productInBasket_widget extends StatefulWidget {
  const productInBasket_widget({Key? key}) : super(key: key);

  @override
  State<productInBasket_widget> createState() => _productInBasket_widgetState();
}

class _productInBasket_widgetState extends State<productInBasket_widget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12,horizontal: 15).r,
      height: 130.h,
      width: 320.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10).r
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 100.h,
            width: 80.w,
            color: Colors.red,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sized(h: 16),
              text("2020 Apple iPad Air 10.9''",
                  clr: Colors.black,
                fontweight: FontWeight.w600
              ),
              sized(h: 8),
              text("\$ 579.00",fontweight: FontWeight.w600),
              sized(h: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Quantity",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w300),),
                  Container(
                    margin: EdgeInsets.only(left: 12).r,
                    width: 70.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 6).r,
                          height: 20.h,
                          width: 20.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4).r,
                            color: AppColors.C_7DCCEC,
                          ),
                          child: Center(
                            child: Text("-",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16),),
                          ),
                        ),
                        Text("71"),
                        Container(
                          margin: EdgeInsets.only(left: 6).r,
                          height: 20.h,
                          width: 20.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4).r,
                            color: AppColors.C_7DCCEC,
                          ),
                          child: Center(
                            child: Text("-",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16),),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          )

        ],
      ),
    );
  }
}
