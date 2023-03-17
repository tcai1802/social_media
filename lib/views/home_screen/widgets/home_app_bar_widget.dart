import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_media/constants/index.dart';

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10.h),
            padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 10.h),
            child: Row(
              children: [
                SvgPicture.asset(
                  AppIcons.instagramIcon,
                  height: 28.h,
                ),
                const Spacer(),
                SvgPicture.asset(
                  AppIcons.heartOffIcon,
                  height: 21.h,
                ),
                SizedBox(width: 16.h),
                SvgPicture.asset(
                  AppIcons.messengerIcon,
                  height: 21.h,
                )
              ],
            ),
          ),
          const Divider(
            color: Color(0xFF979797),
            height: 1,
          ),
        ],
      ),
    );
  }
}
