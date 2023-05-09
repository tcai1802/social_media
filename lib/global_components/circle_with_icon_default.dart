import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_media/constants/colors.dart';

class CircleWithIconDefault extends StatelessWidget {
  const CircleWithIconDefault({
    super.key,
    required this.iconUrl,
    required this.onTap,
  });
  final String iconUrl;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        height: 32.h,
        width: 32.h,
        padding: EdgeInsets.all(8.h),
        decoration: BoxDecoration(
          color:  AppColors.mineShaftColor.withOpacity(0.8),
          borderRadius: BorderRadius.circular(50.r),
        ),
        child: SvgPicture.asset(iconUrl),
      ),
    );
  }
}
