import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tech_shop_app/components/widgets/custom_widgets/product_item.dart';
import 'package:tech_shop_app/view_models/products_view_model.dart';

import '../../../data/models/book_model.dart';
import '../../models/product_model.dart';

// ignore: non_constant_identifier_names
Widget product_view(BuildContext context,String categoryId){
  return SizedBox(
    height: 300.h,
    child: StreamBuilder(
      stream: context.read<ProductsViewModel>().listenCategories(categoryId),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return const CircularProgressIndicator();
        }
        if(snapshot.hasData){
          List<Book>  products=snapshot.data;
          print(products);
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: products.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => product_item(products[index],context),);
        }
        return Container();
      },

    ),
  );
}