import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tech_shop_app/components/local_data/shop_baskett.dart';
import 'package:tech_shop_app/data/models/order_model.dart';
import 'package:tech_shop_app/view_models/order_view_model.dart';

import '../../../data/models/book_model.dart';
import '../../../utils/colors.dart';
import '../../models/product_model.dart';
import '../../routes/routes.dart';

Widget buttonNavigate(Widget mytext, String navigate,
    {required BuildContext context,
    Color clr = AppColors.C_5956E9,
    num h = 70,
    num w = 328,
      bool isLogin=false
    }) {
  return InkWell(
    onTap: () {
      if(isLogin==false)
      Navigator.pushNamed(context, navigate);
    },
    child: Container(
      height: h.toDouble().h,
      width: w.toDouble().w,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10).r, color: clr),
      child: Center(child: mytext),
    ),
  );
}

Widget button_addList(Widget mytext,
    {required BuildContext context,
    Color clr = AppColors.C_5956E9,
    num h = 70,
    num w = 314,
    required Book product,
    required dynamic scaffoldKey}) {
  return InkWell(
    onTap: () async{
        await context.read<OrderViewModel>().addOrder(product.productId);
      final snackBar = SnackBar(
          content: Text("${product.name} added to Shop Basket!"),
        duration: const Duration(milliseconds: 700),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    },
    child: Container(
      height: h.toDouble().h,
      width: w.toDouble().w,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10).r, color: clr),
      child: Center(child: mytext),
    ),
  );
}
