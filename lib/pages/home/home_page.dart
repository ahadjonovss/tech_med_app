import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_shop_app/components/widgets/custom_widgets/product_item.dart';
import 'package:tech_shop_app/components/widgets/custom_widgets/produtc_widget.dart';
import 'package:tech_shop_app/components/widgets/edited_widgets/fitted_img.dart';
import 'package:tech_shop_app/components/widgets/edited_widgets/mediaQuarees.dart';
import 'package:tech_shop_app/components/widgets/edited_widgets/sizedbox.dart';
import 'package:tech_shop_app/utils/colors.dart';

import '../../components/widgets/edited_widgets/text_widget.dart';
import '../../utils/project_images.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.C_E5E5E5,
      drawer: Drawer(),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 32,top:32 ).r,
          height: m_h(context),
          width: m_w(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  fitted_img(img: Images.icn_menu,h: 16,w: 24),
                  Container(
                    margin: EdgeInsets.only(left: 24.w),
                    padding: EdgeInsets.only(left: 12).r,
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
                              child: const TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Search"
                                ),
                              ))
                        ],
                      ),
                    )
                  ),
                ],
              ),
              sized(h: 52),
              text("Order online\ncollect in store",
                clr: Colors.black,
                fontweight: FontWeight.w800,
                fontsize: 34
              ),
              sized(h: 40),
              DefaultTabController(length: 4,
                  child: Column(
                    children:  [
                      const TabBar(
                          tabs: [
                            Tab(child: Text("Wearable"),),
                            Tab(child: Text("Laptops"),),
                            Tab(child: Text("Phones"),),
                            Tab(child: Text("Drones"),),
                          ],
                        indicatorColor: AppColors.C_5956E9,
                        isScrollable: true,
                        labelColor: AppColors.C_5956E9,
                        unselectedLabelColor: Colors.grey,
                      ),
                      sized(h: 20),
                      SizedBox(
                        height: 300.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => product_item(),),
                      )
                    ],
                  )
              )

            ],
          ),
        ),
      ),
    );
  }
}
