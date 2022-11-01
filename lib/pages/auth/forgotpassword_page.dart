import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/routes/routes.dart';
import '../../components/widgets/buttons/navigate_button.dart';
import '../../components/widgets/custom_widgets/text_field_auth.dart';
import '../../components/widgets/edited_widgets/sizedbox.dart';
import '../../components/widgets/edited_widgets/text_widget.dart';
import '../../utils/colors.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.C_5956E9,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 500.h,
              width: 400.w,
              color: AppColors.C_5956E9,
              ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(48).r,
                width: 400.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20).r
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text("Forgot Password",
                        clr: Colors.black,
                        fontsize: 18,
                        fontweight: FontWeight.w800
                    ),
                    SizedBox(height: 12.h,),
                    textfield(title: "Email",
                      hint: "Your Email",
                      icn: Icons.email_outlined,
                    ),
                    SizedBox(height: 32.h,),
                    buttonNavigate(
                        text("Login",clr: Colors.white,
                            fontsize: 20,
                            fontweight: FontWeight.w600
                        ),
                        RouteName.login, context: context),

                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
