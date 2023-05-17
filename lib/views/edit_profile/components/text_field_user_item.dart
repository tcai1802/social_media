import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:social_media/constants/index.dart';

class TextFieldUserItem extends StatelessWidget {
  const TextFieldUserItem({
    super.key,
    this.title = "",
    required this.onChange,
  });
  final String title;
  final Function onChange;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        fontSize: 14.sp,
        color: AppColors.mineShaftColor,
      ),
      onChanged: (value) => onChange(value),
      decoration: InputDecoration(
        labelText: title,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        hintStyle: TextStyle(
          fontSize: 14.sp,
          color: AppColors.dustyGrayColor,
        ),
        //border: InputBorder.none,
      ),
    );
  }
}
