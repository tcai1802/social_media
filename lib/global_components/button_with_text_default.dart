import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media/constants/colors.dart';

class ButtonWithTextDefault extends StatelessWidget {
  const ButtonWithTextDefault({
    super.key,
    this.padding,
    required this.text,
    this.onTap,
    this.bgColor,
    this.borderColor,
    this.textStyle,
  });
  final EdgeInsetsGeometry? padding;
  final String text;
  final Function? onTap;
  final Color? bgColor;
  final Color? borderColor;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap != null ? onTap!() : () {},
      child: Container(
        width: double.infinity,
        padding: padding ??
            EdgeInsets.symmetric(
              vertical: 14.h,
              horizontal: 22.w,
            ),
        decoration: BoxDecoration(
          color: bgColor ?? AppColors.pictonBlueColor,
          borderRadius: BorderRadius.circular(5.r),
          border: borderColor != null ? Border.all(color: borderColor!) : null,
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: textStyle ??
              TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w900,
              ),
        ),
      ),
    );
  }
}
