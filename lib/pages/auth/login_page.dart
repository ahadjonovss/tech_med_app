import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tech_shop_app/components/routes/routes.dart';
import 'package:tech_shop_app/components/widgets/buttons/navigate_button.dart';
import 'package:tech_shop_app/components/widgets/custom_widgets/text_field_auth.dart';
import 'package:tech_shop_app/view_models/auth_view_model.dart';

import '../../components/widgets/edited_widgets/sizedbox.dart';
import '../../components/widgets/edited_widgets/text_widget.dart';
import '../../utils/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email=TextEditingController();
  TextEditingController psw=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.C_5956E9,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  height: 270.h,
                  width: 400.w,
                  color: AppColors.C_5956E9,
                  child: Center(
                    child: text("Welcome\nback",
                      fontweight: FontWeight.w800,
                      fontsize: 65,
                      clr: Colors.white
                    ),
                    ),

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
                        text("Login",
                            clr: Colors.black,
                          fontsize: 18,
                          fontweight: FontWeight.w800
                        ),
                        SizedBox(height: 12.h,),
                        textfield(title: "Email",
                            ctrl: email,
                            hint: "Your Email",
                            icn: Icons.email_outlined,
                            ),
                        SizedBox(height: 12.h,),
                        SizedBox(height: 32.h,),
                        textfield(title: "Password",
                          ctrl: psw,
                          hint: "Your Password",
                          icn: Icons.lock,
                        ),
                        SizedBox(height: 12.h,),
                        InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, RouteName.forgot);
                          },
                            child: text("Forgot Password?",fontsize: 16)),
                        sized(h: 60),
                        InkWell(
                          onTap: (){
                            if(EmailValidator.validate(email.text)){
                              context.read<AuthViewModel>().signIn(context, email: email.text, password: psw.text);
                            }else{
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid email")));
                            }

                          },
                          child: Container(
                            height: 70.h,
                            width:328.w,
                            decoration:
                            BoxDecoration(borderRadius: BorderRadius.circular(10).r, color: AppColors.C_5956E9),
                            child: Center(child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 20.sp),)),
                          ),
                        ),
                        sized(h: 20),
                        Center(child: InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, RouteName.suinup);
                          },
                            child: text("Create account")))

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
