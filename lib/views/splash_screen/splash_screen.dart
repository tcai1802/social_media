import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:social_media/constants/index.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10.h),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                AppIcons.logoIcon,
                height: 100.h,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GradientText(
                    'From',
                    style: TextStyle(
                      fontSize: 14.h,
                      fontWeight: FontWeight.w400,
                    ),
                    colors: [
                      Color(0xFFfeda75),
                      Color(0xFFfa7e1e),
                      Color(0xFFd62976),
                    ],
                  ),
                  Image.asset(
                    AppIcons.logoMetaIcon,
                    height: 28.h,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
