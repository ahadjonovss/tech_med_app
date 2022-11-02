import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_shop_app/components/local_data/database.dart';
import 'package:tech_shop_app/components/routes/routes.dart';
import 'package:tech_shop_app/components/widgets/custom_widgets/product_view.dart';
import 'package:tech_shop_app/components/widgets/custom_widgets/search_widget.dart';
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
  TextEditingController ctrl=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.C_E5E5E5,
      drawer: const Drawer(),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 32,top:32 ).r,
          height: m_h(context),
          width: m_w(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  fitted_img(img: Images.icn_menu,h: 16,w: 24),
                  search_widget(ctrl),
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
                        height: 300.w,
                        child: TabBarView(
                            children: [
                              product_view(context,wearables),
                              product_view(context, laptops),
                              product_view(context, laptops),
                              product_view(context, drones)
                            ]),
                      )
                    ],
                  )
              ),
              sized(h:12),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RouteName.search);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    text("See more",fontweight: FontWeight.w800),
                    Icon(Icons.navigate_next_outlined,color: AppColors.C_5956E9,),
                    sized(w:12),
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
