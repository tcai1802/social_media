import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_media/constants/index.dart';

class AddPostAppBarWidget extends StatelessWidget {
  const AddPostAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 14.h),
      child: Row(
        children: [
          InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: SvgPicture.asset(
              AppIcons.closeIcon,
              height: 18.h,
            ),
          ),
          SizedBox(width: 20.w),
          Text(
            "New Post",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Spacer(),
          Text(
            "Next",
            style: TextStyle(
              fontSize: 16.sp,
              color: const Color(0xFF3897F0),
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}
