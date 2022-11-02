import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_shop_app/components/widgets/custom_widgets/product_item.dart';

import '../../models/product_model.dart';

Widget product_view(BuildContext context,List<Product> products){
  return SizedBox(
    height: 300.h,
    child: ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: products.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => product_item(products[index]),),
  );
}