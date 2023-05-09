import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:social_media/config/routes.dart';
import 'package:social_media/constants/index.dart';
import 'package:social_media/models/user/user_hive.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      const Duration(seconds: 1),
      () async {
        if (FirebaseAuth.instance.currentUser != null) {
          Navigator.pushNamed(context, Routes.mainRoute);
        } else {
          Navigator.pushNamed(context, Routes.loginRoute);
        }
      },
    );
  }

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
                    AppStrings.from,
                    style: TextStyle(
                      fontSize: 14.h,
                      fontWeight: FontWeight.w400,
                    ),
                    colors: const [
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
