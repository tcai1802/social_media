import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media/global_components/index.dart';
import 'package:social_media/models/models.dart';

class SearchUserItem extends StatelessWidget {
  const SearchUserItem({super.key, required this.userModel});
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.h),
      child: Row(
        children: [
          UserAvatarDefault(
            imageUrl: userModel.avatarUrl,
          ),
          SizedBox(width: 10.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userModel.userName ?? "",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                userModel.fullName ?? "",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
