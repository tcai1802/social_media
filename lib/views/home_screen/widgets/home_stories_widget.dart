import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media/global_components/index.dart';

class HomeStoriesWidget extends StatelessWidget {
  const HomeStoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 98.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 6.h),
          Flexible(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(left: 10.h),
                  child: UserAvatarDefault(
                    text: "karennne",
                  ),
                );
              },
            ),
          ),
          const Divider(
            color: Color(0xFF979797),
            height: 1,
          ),
        ],
      ),
    );
  }
}
