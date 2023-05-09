import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:social_media/constants/colors.dart';
import 'package:social_media/constants/index.dart';

class UserAvatarDefault extends StatelessWidget {
  const UserAvatarDefault({
    super.key,
    this.isAdd = false,
    this.text,
    this.imageUrl,
    this.size = 62,
    this.isViewedAll = false,
    this.enableBorder = false,
  });
  final bool? isAdd;
  final String? text;
  final String? imageUrl;
  final double size;
  final bool? isViewedAll;
  final bool enableBorder;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                height: size.h,
                width: size.h,
                padding: EdgeInsets.all(2.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.r),
                  border: enableBorder
                      ? isViewedAll!
                          ? const GradientBoxBorder(
                              gradient: AppGradientColors.orangeLinearGradient,
                              width: 2,
                            )
                          : Border.all(width: 2, color: AppColors.sliverColor)
                      : null,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    border:
                        Border.all(width: 1, color: AppColors.sliverColor),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50.r),
                    child: Image.network(
                      imageUrl ??
                          "https://i.pinimg.com/564x/53/03/6f/53036ff32118a777bc84223f35aeb1cf.jpg",
                    ),
                  ),
                ),
              ),
              if (isAdd!)
                Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.r),
                        color: Colors.white,
                      ),
                      child: SvgPicture.asset(
                        AppIcons.addCircleIcon,
                        height: 18.w,
                      ),
                    ))
            ],
          ),
          if (text != null)
            Text(
              text!,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
            )
        ],
      ),
    );
  }
}
