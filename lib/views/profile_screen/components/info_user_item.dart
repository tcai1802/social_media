import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

infoUserItem({int number = 0, String title = ""}) {
  return Expanded(
    child: Column(
      children: [
        Text(
          number.toString(),
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w900,
          ),
        ),
        Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    ),
  );
}
