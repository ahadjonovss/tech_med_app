import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tech_shop_app/components/local_data/shared_prefarence.dart';
import 'package:tech_shop_app/components/widgets/edited_widgets/mediaQuarees.dart';
import 'package:tech_shop_app/data/models/user_model.dart';
import 'package:tech_shop_app/view_models/auth_view_model.dart';
import '../../components/routes/routes.dart';
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
  TextEditingController email_ctrl=TextEditingController();
  TextEditingController psw_ctrl=TextEditingController();
  TextEditingController name_ctrl=TextEditingController();
  TextEditingController num_ctrl=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.C_5956E9,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: m_h(context),
            width: m_w(context),
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
                          ctrl: name_ctrl
                        ),
                        sized(h: 32),
                        sized(h: 12),
                        textfield(title: "Number",
                          hint: "Your Number",
                          icn: Icons.phone_iphone,
                          ctrl: num_ctrl
                        ),
                        sized(h: 32),
                        textfield(title: "Email",
                          hint: "Your Email",
                          icn: Icons.email_outlined,
                          ctrl: email_ctrl
                        ),
                        SizedBox(height: 12.h,),
                        SizedBox(height: 32.h,),
                        textfield(title: "Password",
                          hint: "Your Password",
                          icn: Icons.lock,
                          ctrl: psw_ctrl
                        ),
                        sized(h: 60),
                        InkWell(
                          onTap: () async {
                            if(EmailValidator.validate(email_ctrl.text)){
                              UserModel newUser=UserModel(name: name_ctrl.text, number: num_ctrl.text, password: psw_ctrl.text, email: email_ctrl.text, orders: []);
                              await context.read<AuthViewModel>().signUp(context:context,user: newUser);
                            }else{
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid email")));
                            }
                          },
                          child: Container(
                            height: 70.h,
                            width: 314.w,
                            decoration:
                            BoxDecoration(borderRadius: BorderRadius.circular(10).r, color:AppColors.C_5956E9),
                            child: Center(child: Text("Sign Up",
                              style: TextStyle(color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600),)),
                          )
                        ),

                      ],
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
