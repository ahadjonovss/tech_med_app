import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tech_shop_app/components/local_data/database.dart';
import 'package:tech_shop_app/components/routes/routes.dart';
import 'package:tech_shop_app/components/widgets/custom_widgets/product_view.dart';
import 'package:tech_shop_app/components/widgets/custom_widgets/search_widget.dart';
import 'package:tech_shop_app/components/widgets/edited_widgets/fitted_img.dart';
import 'package:tech_shop_app/components/widgets/edited_widgets/mediaQuarees.dart';
import 'package:tech_shop_app/components/widgets/edited_widgets/sizedbox.dart';
import 'package:tech_shop_app/data/models/category_model.dart';
import 'package:tech_shop_app/utils/colors.dart';
import 'package:tech_shop_app/view_models/categories_view_model.dart';

import '../../components/widgets/edited_widgets/text_widget.dart';
import '../../utils/project_images.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController ctrl=TextEditingController();
  String category="46BtOJnBeDwvUKB7ALwp";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
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
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, RouteName.search);
                    },
                      child: search_widget(ctrl)),
                ],
              ),
              sized(h: 52),
              text("Order online\ncollect in store",
                  clr: Colors.black,
                  fontweight: FontWeight.w800,
                  fontsize: 34
              ),
              sized(h: 40),
              StreamBuilder(
                stream: context.read<CategoriesViewModel>().listenCategories(),
                  builder: ((context, snapshot) {
                    if(snapshot.hasData){
                      List<CategoryModel> categories=snapshot.data!;
                      return Column(
                        children: [
                          SizedBox(
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) => InkWell(
                                onTap: (){
                                  category=categories[index].docId!;
                                  setState(() {

                                  });
                                },
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                    padding:const  EdgeInsets.all(6),
                                    margin: const EdgeInsets.only(left: 8,bottom: 30,right: 20),
                                    child: Center(child: Text(categories[index].categoryName,style: TextStyle(color: AppColors.C_5956E9,fontWeight: FontWeight.w600,fontSize: 16),))),
                              ),
                              itemCount: categories.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 300.h,
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                print(category);
                                return product_view(context, category);
                              },
                              shrinkWrap: true,
                              itemCount: categories.length,
                            ),
                          )
                        ],
                      );
                      return DefaultTabController(
                          length: categories.length,
                          child: Column(
                            children:  [
                               TabBar(
                                tabs: [

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


                                    ]),
                              )
                            ],
                          )
                      );
                    }
                    if(snapshot.connectionState==ConnectionState.waiting){
                      return CircularProgressIndicator();
                    }
                    if(snapshot.hasError){
                      print("ERRRROR");
                      print(snapshot.error.toString());
                    }
                    return Container();

              })),
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
