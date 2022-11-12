import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_shop_app/components/local_data/shop_baskett.dart';

import '../../../utils/colors.dart';
import '../../models/product_model.dart';
import '../../routes/routes.dart';

Widget buttonNavigate(Widget mytext, String navigate,
    {required BuildContext context,
    Color clr = AppColors.C_5956E9,
    num h = 70,
    num w = 328}) {
  return InkWell(
    onTap: () {
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
    required Product product,
    required dynamic scaffoldKey}) {
  return InkWell(
    onTap: () {
        product.count++;
        shop_basket.add(product);
      final snackBar = SnackBar(
          content: Text("${product.title} added to Shop Basket!"),
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
