import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/routes/routes.dart';
import '../../components/widgets/buttons/navigate_button.dart';
import '../../components/widgets/custom_widgets/text_field_auth.dart';
import '../../components/widgets/edited_widgets/sizedbox.dart';
import '../../components/widgets/edited_widgets/text_widget.dart';
import '../../utils/colors.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.C_5956E9,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 130.h,
              width: 400.w,
              color: AppColors.C_5956E9,

            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(48).r,
                width: 400.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(topRight: Radius.circular(20),
                        topLeft: Radius.circular(20)).r
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text("Sign Up",
                        clr: Colors.black,
                        fontsize: 18,
                        fontweight: FontWeight.w800
                    ),
                    sized(h: 12),
                    textfield(title: "Name",
                      hint: "Your Name",
                      icn: Icons.person_outline,
                    ),
                    sized(h: 32),
                    sized(h: 12),
                    textfield(title: "Number",
                      hint: "Your Number",
                      icn: Icons.phone_iphone,
                    ),
                    sized(h: 32),
                    textfield(title: "Email",
                      hint: "Your Email",
                      icn: Icons.email_outlined,
                    ),
                    SizedBox(height: 12.h,),
                    SizedBox(height: 32.h,),
                    textfield(title: "Password",
                      hint: "Your Password",
                      icn: Icons.lock,
                    ),
                    sized(h: 60),
                    buttonNavigate(
                        text("Sign Up",clr: Colors.white,
                            fontsize: 20,
                            fontweight: FontWeight.w600
                        ),
                        RouteName.main, context: context),

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
