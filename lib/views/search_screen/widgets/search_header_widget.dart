import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_media/constants/icons.dart';

class SearchHeaderWidget extends StatelessWidget {
  const SearchHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(14.h),
      padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 8.h),
      decoration: BoxDecoration(
        color: const Color(0xFF767680).withOpacity(0.17),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            AppIcons.searchOffIcon,
            height: 18.h,
          ),
          SizedBox(width: 10.h),
          Expanded(
            child: TextField(
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                isDense: true,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                hintText: 'Search',
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
