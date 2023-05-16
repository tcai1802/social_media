import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_media/constants/index.dart';

class EditProfileHeaderWidget extends StatelessWidget {
  const EditProfileHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 11.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: SvgPicture.asset(
              AppIcons.closeIcon,
              height: 18.h,
            ),
          ),
          SizedBox(width: 10.h),
          Text(
            AppStrings.editProfile,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w900,
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.check,
            color: AppColors.pictonBlueColor,
          )
        ],
      ),
    );
  }
}
