import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_shop_app/components/local_data/shop_baskett.dart';
import 'package:tech_shop_app/components/routes/routes.dart';
import 'package:tech_shop_app/components/widgets/edited_widgets/sizedbox.dart';
import 'package:tech_shop_app/components/widgets/edited_widgets/text_widget.dart';
import 'package:tech_shop_app/utils/colors.dart';

import '../../../data/models/book_model.dart';


class productInBasket_widget extends StatefulWidget {
  VoidCallback setstatePage;
  Book product;
   productInBasket_widget({required this.setstatePage,required this.product,Key? key}) : super(key: key);

  @override
  State<productInBasket_widget> createState() => _productInBasket_widgetState();
}

class _productInBasket_widgetState extends State<productInBasket_widget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20).r,
      padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 15).r,
      height: 130.h,
      width: 320.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10).r
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 100.h,
            width: 80.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.product.mainImage)
              )
            ),
          ),
          sized(w: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sized(h: 16),
              text(widget.product.name+" "+widget.product.author,
                  clr: Colors.black,
                fontweight: FontWeight.w600
              ),
              sized(h: 8),
              text("\$ ${widget.product.price}",fontweight: FontWeight.w600),
              sized(h: 8),
              // InkWell(
              //   onTap: (){
              //     widget.product.count++;
              //     widget.product.isLiked=false;
              //     shop_basket.add(widget.product);
              //     final snackBar = SnackBar(
              //       content: Text("${widget.product.title} added to Shop Basket!"),
              //       duration: const Duration(milliseconds: 700),
              //     );
              //
              //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
              //     widget.setstatePage;
              //
              //   },
              //     child: text("Add to basket",fontweight: FontWeight.w600))
            ],
          )

        ],
      ),
    );
  }
}
