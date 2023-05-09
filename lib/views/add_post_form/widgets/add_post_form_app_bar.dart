import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:social_media/constants/index.dart';
import 'package:social_media/providers/providers.dart';

class AddPostFormAppBar extends StatelessWidget {
  const AddPostFormAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AddPostProvider>(builder: (context, value, child) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 14.h),
        child: Row(
          children: [
            InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  size: 20.h,
                  color: Colors.black,
                )),
            SizedBox(width: 20.w),
            Text(
              AppStrings.newPost,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () => value.handleCreatePost(context),
              child: Icon(
                Icons.done,
                size: 20.h,
                color: Colors.blue,
              ),
            )
          ],
        ),
      );
    });
  }
}
