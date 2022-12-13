import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tech_shop_app/data/models/order_model.dart';
import 'package:tech_shop_app/view_models/order_view_model.dart';
import 'package:tech_shop_app/view_models/products_view_model.dart';

import '../../../components/local_data/shop_baskett.dart';
import '../../../components/widgets/edited_widgets/sizedbox.dart';
import '../../../components/widgets/edited_widgets/text_widget.dart';
import '../../../data/models/book_model.dart';
import '../../../utils/colors.dart';

class CartItem extends StatefulWidget {
  String orderId;
  CartItem({required this.orderId,Key? key}) : super(key: key);

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<OrderViewModel>().getProductIdByOrderId(context,widget.orderId),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if(snapshot.hasData){
          print("Data ${snapshot.data}");
          Book product=snapshot.data[1];
          OrderModel order=snapshot.data[0];
          return Container(
            margin:
            const EdgeInsets.only(bottom: 20).r,
            padding: const EdgeInsets.symmetric(
                vertical: 12, horizontal: 15)
                .r,
            height: 130.h,
            width: 320.w,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.circular(10).r),
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.start,
              children: [
                Container(
                  height: 100.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              product.mainImage))),
                ),
                sized(w: 20),
                Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    sized(h: 16),
                    Container(
                      child: text((product.name),
                          clr: Colors.black,
                          fontweight:
                          FontWeight.w600),
                    ),
                    sized(h: 8),
                    text("${product.price} UZS",
                        fontweight:
                        FontWeight.w600),
                    sized(h: 8),
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment
                          .spaceAround,
                      children: [
                        Text(
                          "Quantity",
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight:
                              FontWeight.w300),
                        ),
                        Container(
                          margin:
                          const EdgeInsets.only(
                              left: 12)
                              .r,
                          width: 70.w,
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment
                                .spaceBetween,
                            children: [
                              Container(
                                margin:
                                const EdgeInsets
                                    .only(
                                    right:
                                    6)
                                    .r,
                                height: 20.h,
                                width: 20.h,
                                decoration:
                                BoxDecoration(
                                  borderRadius:
                                  BorderRadius
                                      .circular(
                                      4)
                                      .r,
                                  color: AppColors
                                      .C_7DCCEC,
                                ),
                                child: Center(
                                  child: InkWell(
                                      onTap: () {
                                        // if (shop_basket.elementAt(0).count != 1) {
                                        //   shop_basket.elementAt(0).count--;
                                        // }
                                        // if (shop_basket.elementAt(0).count == 1) {
                                        //   shop_basket.elementAt(0).count--;
                                        //   shop_basket.remove(shop_basket.elementAt(0));
                                        // }
                                        // setState(() {});
                                      },
                                      child:
                                      const Text("-", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
                                      )),
                                ),
                              ),
                              Text(order.count
                                  .toString()),
                              Container(
                                margin:
                                const EdgeInsets
                                    .only(
                                    left: 6)
                                    .r,
                                height: 20.h,
                                width: 20.h,
                                decoration:
                                BoxDecoration(
                                  borderRadius:
                                  BorderRadius
                                      .circular(
                                      4)
                                      .r,
                                  color: AppColors
                                      .C_7DCCEC,
                                ),
                                child: Center(
                                  child: InkWell(
                                      onTap: () async {
                                        context.read<OrderViewModel>().addOrder(product.productId);
                                        setState(() {

                                        });
                                      },
                                      child:
                                       Consumer(
                                         builder: (BuildContext context, value, Widget? child) {
                                           return const Text(
                                             "+",
                                             style: TextStyle(
                                                 color: Colors
                                                     .white,
                                                 fontWeight:
                                                 FontWeight
                                                     .w600,
                                                 fontSize:
                                                 16),
                                           );
                                         },
                                       )),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          );

        }
        if(snapshot.hasError){
          print(snapshot.error.toString());
        }
        return Container();
      },

    );
  }
}
