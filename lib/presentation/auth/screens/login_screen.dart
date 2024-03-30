import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:qataloog/core/utils/color_manager.dart';
import 'package:qataloog/core/utils/style_manager.dart';
import 'package:qataloog/presentation/auth/controller.dart';

import '../../../core/shared_widgets/custom_button.dart';
import '../../../core/shared_widgets/input_field.dart';
import 'widgets/top_clip.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool termsAndConditions = false;
  bool isPasswordObscure = true;
  bool isConfirmObscure = true;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthenticationProvider>(context);
    return Scaffold(
        backgroundColor: ColorManager.scaffoldBackgroundColor,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipPath(
                  clipper: TopClip(),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.2,
                    decoration: BoxDecoration(
                      color: ColorManager.primaryOrange,
                      // borderRadius: BorderRadius.only(
                      //   bottomLeft: Radius.circular(0),
                      //   bottomRight: Radius.circular(60.r),
                      // ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 60.h,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome back!",
                        style: getBoldTextStyle(
                            color: Colors.black, fontSize: 32.sp),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Text(
                        "Hello there, Sign in to continue",
                        style: getLightTextStyle(
                            color: Colors.black, fontSize: 18.sp),
                      ),
                      SizedBox(
                        height: 60.h,
                      ),
                      CustomTextInputWidget(
                        controller: emailController,
                        hintText: "Email",
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomTextInputWidget(
                          controller: passwordController,
                          hintText: "Password",
                          isObscure: isPasswordObscure,
                          suffixIcon: IconButton(
                            icon: Icon(
                                isPasswordObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: ColorManager.textGrey),
                            onPressed: () {
                              setState(() {
                                isPasswordObscure = !isPasswordObscure;
                              });
                            },
                          )),
                      SizedBox(
                        height: 20.h,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          child: const Text(
                            "Forgot Password",
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      CustomButton(
                          isLoading: isLoading,
                          onPressed: () async {
                            setState(() {
                              isLoading = true;
                            });
                            await authProvider.userLogin(emailController.text,
                                passwordController.text, context);
                            setState(() {
                              isLoading = false;
                            });
                          },
                          text: "Login"),
                      SizedBox(
                        height: 100.h,
                      ),
                      Center(
                        child: RichText(
                          text: TextSpan(children: [
                            const TextSpan(
                                text: "Don't have an account?",
                                style: TextStyle(color: ColorManager.textGrey)),
                            TextSpan(
                                text: "Sign Up",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {}),
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
