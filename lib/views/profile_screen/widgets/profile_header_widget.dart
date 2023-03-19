import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_media/constants/index.dart';

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 11.h),
      child: Row(
        children: [
          SvgPicture.asset(
            AppIcons.privateIcon,
            height: 18.h,
          ),
          SizedBox(width: 10.h),
          const Text(
            "jacob_w",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w900,
            ),
          ),
          const Spacer(),
          SvgPicture.asset(
            AppIcons.menuIcon,
            height: 18.h,
          )
        ],
      ),
    );
  }
}
