import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_shop_app/components/widgets/custom_widgets/search_widget.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.C_E5E5E5,
      drawer: const Drawer(),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 32, top: 32).r,
          height: m_h(context),
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
                  search_widget(ctrl)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
