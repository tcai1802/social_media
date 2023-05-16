import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:social_media/config/routes.dart';
import 'package:social_media/constants/index.dart';
import 'package:social_media/global_components/index.dart';
import 'package:social_media/providers/login/login_provider.dart';
import 'package:social_media/views/profile_screen/components/components.dart';

class ProfileInfoWidget extends StatelessWidget {
  const ProfileInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(builder: (context, value, child) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UserAvatarDefault(
                  size: 86.h,
                ),
                infoUserItem(title: AppStrings.posts),
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("favorites")
                      .where('target_id', isEqualTo: value.currentUser?.userId)
                      .snapshots(),
                  builder: (context, snapshot) => infoUserItem(
                    title: AppStrings.followers,
                    number:
                        snapshot.data != null ? snapshot.data!.docs.length : 0,
                  ),
                ),
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("favorites")
                      .where('user_id', isEqualTo: value.currentUser?.userId)
                      .snapshots(),
                  builder: (context, snapshot) {
                    return infoUserItem(
                      title: AppStrings.following,
                      number: snapshot.data != null
                          ? snapshot.data!.docs.length
                          : 0,
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Text(
              value.currentUser?.fullName ?? "",
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(
              "Digital goodies designer @pixsellz Everything is designed.",
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 15.h),
            ButtonWithTextDefault(
              text: AppStrings.editProfile,
              bgColor: Colors.white,
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 13.sp,
                fontWeight: FontWeight.w900,
              ),
              borderColor: const Color(0xFF3C3C43).withOpacity(0.18),
              padding: EdgeInsets.symmetric(vertical: 5.h),
              onTap: () => Navigator.pushNamed(context, Routes.editProfile),
            ),
            SizedBox(height: 16.h),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  AddNewDefault(
                    size: 64.h,
                    text: "New",
                  ),
                  SizedBox(width: 22.h),
                  UserAvatarDefault(
                    size: 64.h,
                    text: "Friend",
                  ),
                  SizedBox(width: 22.h),
                  UserAvatarDefault(
                    size: 64.h,
                    text: "Sport",
                  ),
                  SizedBox(width: 22.h),
                  UserAvatarDefault(
                    size: 64.h,
                    text: "Design",
                  ),
                  SizedBox(width: 22.h),
                  UserAvatarDefault(
                    size: 64.h,
                    text: "Karate",
                  ),
                  SizedBox(width: 22.h),
                  UserAvatarDefault(
                    size: 64.h,
                    text: "IT",
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
