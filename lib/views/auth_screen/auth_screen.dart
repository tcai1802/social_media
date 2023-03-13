import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_media/constants/icons.dart';
import 'package:social_media/global_components/index.dart';
import 'package:social_media/views/index.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            SvgPicture.asset(
              AppIcons.instagramIcon,
              height: 49.h,
            ),
            const Spacer(),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 34.w),
              child: ButtonWithTextDefault(
                text: "Login",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ));
                },
              ),
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
                    "Don’t have an account?",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(
                        0xFF979797,
                      ),
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w900,
                      color: const Color(0xFF262626),
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
