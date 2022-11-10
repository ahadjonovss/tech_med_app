import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_shop_app/components/local_data/database.dart';
import 'package:tech_shop_app/components/widgets/custom_widgets/product_item.dart';
import 'package:tech_shop_app/components/widgets/custom_widgets/search_widget.dart';
import 'package:tech_shop_app/service/search_service.dart';

import '../../components/models/product_model.dart';
import '../../components/widgets/edited_widgets/fitted_img.dart';
import '../../components/widgets/edited_widgets/mediaQuarees.dart';
import '../../components/widgets/edited_widgets/sizedbox.dart';
import '../../utils/colors.dart';
import '../../utils/project_images.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController ctrl = TextEditingController();
  List<Product> found=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.C_E5E5E5,
      drawer: const Drawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 20, top: 32,right: 20).r,
            height: 1200,
            width: m_w(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.arrow_back_ios)),
                    Container(
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
                                  child: TextField(
                                    controller: ctrl,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Search",
                                    ),
                                    onChanged: (val){
                                      setState(() {
                                        found=searchByName(val);
                                      });
                                    },
                                  )
                              )
                            ],
                          ),
                        )
                    )
                  ],
                ),
                Container(
                  width: 400,
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: found.length,
                    gridDelegate: const  SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,

                    ),
                    itemBuilder:(context, index) {
                      return product_item(found[index], context);
                    }, )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
