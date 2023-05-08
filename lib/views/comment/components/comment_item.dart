import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media/global_components/index.dart';
import 'package:social_media/models/models.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({super.key, required this.data});
  final CommentModel data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          UserAvatarDefault(
            size: 40.h,
            enableBorder: false,
          ),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "tcai2000",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.blue,
                  fontSize: 14.sp,
                ),
              ),
              Text(
                data.content ?? "",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
