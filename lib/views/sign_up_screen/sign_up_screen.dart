import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_media/constants/icons.dart';
import 'package:social_media/global_components/index.dart';
import 'package:social_media/config/routes.dart';
import 'package:social_media/providers/providers.dart';
import 'package:social_media/views/index.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController userNameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const Spacer(),
            SvgPicture.asset(
              AppIcons.instagramIcon,
              height: 49.h,
            ),
            SizedBox(height: 48.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFFAFAFA),
                      border: Border.all(
                        width: 1,
                        color: const Color(0xFFD2E3EE),
                      ),
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 14.h),
                    child: TextField(
                      controller: userNameController,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xFF262626),
                      ),
                      decoration: InputDecoration(
                        hintText: "username",
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 0),
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          color: Color(0xFF979797),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFFAFAFA),
                      border: Border.all(
                        width: 1,
                        color: Color(0xFFD2E3EE),
                      ),
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 14.h),
                    child: TextField(
                      controller: passwordController,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xFF262626),
                      ),
                      decoration: InputDecoration(
                        hintText: "password",
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 0),
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          color: Color(0xFF979797),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 26.h),
                  ButtonWithTextDefault(
                    text: "Sign up",
                    onTap: () {
                      LoginProvider().handleSignUp(
                        context,
                        userName: userNameController.text.trim(),
                        password: passwordController.text.trim(),
                      );
                    },
                    bgColor: Color(0xFFb9BCBF7),
                  ),
                ],
              ),
            ),
            SizedBox(height: 36.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppIcons.facebookIcon),
                SizedBox(width: 4.w),
                Text(
                  "Sign up with Facebook",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w900,
                    color: const Color(0xFF3797EF),
                  ),
                )
              ],
            ),
            const Spacer(),
            const Divider(
              color: Color(0xFF979797),
              height: 1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 18.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "You have an account?",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(
                        0xFF979797,
                      ),
                    ),
                  ),
                  SizedBox(width: 4.w),
                  InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, Routes.loginRoute),
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF3797EF),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
