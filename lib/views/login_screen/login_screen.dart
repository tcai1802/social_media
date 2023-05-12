import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_media/constants/icons.dart';
import 'package:social_media/constants/index.dart';
import 'package:social_media/global_components/index.dart';
import 'package:social_media/config/routes.dart';
import 'package:social_media/providers/login/login_provider.dart';
import 'package:social_media/views/index.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                      color: AppColors.alabasterColor,
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
                          color: AppColors.dustyGrayColor,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.alabasterColor,
                      border: Border.all(
                        width: 1,
                        color: AppColors.jaggedIceColor,
                      ),
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 14.h),
                    child: TextField(
                      controller: passwordController,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.mineShaftColor,
                      ),
                      decoration: InputDecoration(
                        hintText: "password",
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 0),
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.dustyGrayColor,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 19.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      AppStrings.forgotPassword,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF3797EF),
                      ),
                    ),
                  ),
                  SizedBox(height: 26.h),
                  ButtonWithTextDefault(
                    text: AppStrings.login,
                    bgColor: AppColors.magnoliaColor,
                    onTap: () {
                      //print('Data ${userNameController.text.trim()}');
                      LoginProvider().handleLogin(context,
                          //userName: userNameController.text.trim(),
                          //password: passwordController.text.trim(),
                          userName: "tcaiqb@gmail.com",
                          password: 'admin123');
                    },
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
                  AppStrings.loginFacebook,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w900,
                    color: const Color(0xFF3797EF),
                  ),
                )
              ],
            ),
            const Spacer(),
            const Divider(color: AppColors.dustyGrayColor, height: 1),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 18.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.notHaveAccount,
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.dustyGrayColor),
                  ),
                  SizedBox(width: 4.w),
                  InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, Routes.signUpRoute),
                    child: Text(
                      AppStrings.signUp,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.pictonBlueColor,
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
