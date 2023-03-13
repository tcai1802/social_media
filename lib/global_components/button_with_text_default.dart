import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonWithTextDefault extends StatelessWidget {
  const ButtonWithTextDefault({
    super.key,
    this.padding,
    required this.text,
    this.onTap,
    this.bgColor,
  });
  final EdgeInsetsGeometry? padding;
  final String text;
  final Function? onTap;
  final Color? bgColor;
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
          color: bgColor ?? const Color(0xFF3797EF),
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
