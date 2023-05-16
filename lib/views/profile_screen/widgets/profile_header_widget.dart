import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:social_media/constants/index.dart';
import 'package:social_media/providers/login/login_provider.dart';

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(builder: (context, value, child) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 11.h),
        child: Row(
          children: [
            SvgPicture.asset(
              AppIcons.privateIcon,
              height: 18.h,
            ),
            SizedBox(width: 10.h),
            Text(
              value.currentUser?.userName ?? "",
              style: TextStyle(
                fontSize: 16.sp,
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
    });
  }
}
