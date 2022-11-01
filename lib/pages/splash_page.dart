import 'package:flutter/material.dart';
import 'package:tech_shop_app/components/routes/routes.dart';
import 'package:tech_shop_app/components/widgets/buttons/navigate_button.dart';
import 'package:tech_shop_app/components/widgets/edited_widgets/fitted_img.dart';
import 'package:tech_shop_app/components/widgets/edited_widgets/sizedbox.dart';
import 'package:tech_shop_app/utils/colors.dart';           
import '../components/widgets/edited_widgets/mediaQuarees.dart';
import '../components/widgets/edited_widgets/text_widget.dart';
import '../utils/project_images.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: m_w(context),
          height: m_h(context),
          color: AppColors.C_5956E9.withOpacity(0.7),
          child: Column(
            children: [
              sized(h: 50),
              text("Find Your\nGadget",fontsize: 65,
                fontweight: FontWeight.w800,
                clr: Colors.white
              ),
              fitted_img(img: Images.png_splash,h: 400,w: 400),
              sized(h: 64),
              buttonNavigate(
                  text("Get Started",
                  clr: AppColors.C_5956E9.withOpacity(0.7)),
                  RouteName.login,clr: Colors.white,
                  context: context)
            ],
          ),
        ),
      ),
    );
  }
}
