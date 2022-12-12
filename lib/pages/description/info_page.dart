import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:tech_shop_app/components/widgets/buttons/navigate_button.dart';
import 'package:tech_shop_app/components/widgets/edited_widgets/fitted_img.dart';
import 'package:tech_shop_app/components/widgets/edited_widgets/sizedbox.dart';
import 'package:tech_shop_app/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../components/widgets/edited_widgets/mediaQuarees.dart';
import '../../components/widgets/edited_widgets/text_widget.dart';
import '../../data/models/book_model.dart';

class InformationPage extends StatefulWidget {
  Book product;
  InformationPage({Key? key, required this.product}) : super(key: key);

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  PageController ctrl = PageController();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.98),
      body: SafeArea(
        child: SizedBox(
          height: m_h(context),
          width: m_w(context),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(32).r,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(Icons.arrow_back_ios)),
                        // InkWell(
                        //     onTap: () {
                        //       // widget.product.isLiked = !widget.product.isLiked;
                        //       setState(() {});
                        //     },
                        //     child: Icon(widget.product.isLiked == true
                        //         ? Icons.favorite
                        //         : Icons.favorite_outline)),
                      ],
                    ),
                    sized(h: 20),
                    SizedBox(
                      width: 400.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 220.h,
                            width: 400.w,
                            child: PageView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollBehavior: const CupertinoScrollBehavior(),
                              controller: ctrl,
                              onPageChanged: (value) {
                                setState(() {
                                  currentPage = value;
                                });
                              },
                              itemCount: widget.product.images.length,
                              itemBuilder: (context, index) {
                                return fitted_img_net(
                                    img: widget.product.images[index],
                                    h: 300,
                                    w: 200);
                              },
                            ),
                          ),
                          sized(h: 20),
                          PageViewDotIndicator(
                            currentItem: currentPage,
                            count: widget.product.images.length,
                            unselectedColor: Colors.black26,
                            selectedColor: AppColors.C_5956E9,
                            size: const Size(12, 12),
                            unselectedSize: const Size(8, 8),
                            duration: const Duration(milliseconds: 200),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            padding: const EdgeInsets.all(0).r,
                            alignment: Alignment.center,
                            fadeEdges: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                    padding: EdgeInsets.all(32).r,
                    width: m_w(context),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20).r

                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: text(widget.product.name,
                            clr: Colors.black,
                            fontweight: FontWeight.w600,
                            fontsize: 28
                          ),
                        ),
                        sized(h: 32),
                        text(
                          "Get Apple TV+ free for a year",
                          fontsize: 17,
                          fontweight: FontWeight.w600,
                          clr: Colors.black
                        ),
                        sized(h: 20),
                        Text(widget.product.description,
                          maxLines: 5,
                        ),
                        sized(h: 12),
                        InkWell(
                          onTap: (){},
                          child: Row(
                            children: [
                              InkWell(
                                child: text("Full desription",
                                  fontweight: FontWeight.w600
                                ),
                                onTap: () async {
                                  if (!await launchUrl(
                                  Uri.parse(widget.product.mainImage??""),
                                  mode: LaunchMode.inAppWebView,
                                  webViewConfiguration: const WebViewConfiguration(
                                  headers: <String, String>{'my_header_key': 'my_header_value'}),
                                  )) {
                                  throw 'Could not launch ${widget.product.mainImage}';
                                  }
                                },
                              ),
                              const Icon(Icons.navigate_next,color: AppColors.C_5956E9,)
                            ],
                          ),
                        ) ,
                        sized(h: 24),//full desc
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total",style: TextStyle(fontSize: 18.sp),),
                            text("\$ ${widget.product.price}",
                                fontweight: FontWeight.w800,
                              fontsize: 22
                            )
                          ],
                        ),
                        sized(h: 40),
                        button_addList(
                            text("Add to Basket",
                                clr: Colors.white,
                              fontsize: 20,
                              fontweight: FontWeight.w600
                            )
                            , context: context,
                            product: widget.product,
                          scaffoldKey: _scaffoldKey
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
