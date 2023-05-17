import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:social_media/constants/index.dart';
import 'package:social_media/providers/providers.dart';

class EditProfileHeaderWidget extends StatelessWidget {
  const EditProfileHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final editProfileProvider =
        Provider.of<EditProfileProvider>(context, listen: false);
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 11.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: SvgPicture.asset(
              AppIcons.closeIcon,
              height: 18.h,
            ),
          ),
          SizedBox(width: 10.h),
          Text(
            AppStrings.editProfile,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w900,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              loginProvider.currentUser?.fullName =
                  editProfileProvider.fullNameController.text;
              print("====${loginProvider.currentUser?.toJson()}");
              userProvider.handleUpdateUserInfo(context,
                  data: loginProvider.currentUser?.toJson() ?? {},
                  userId: loginProvider.currentUser?.userId ?? "");
            },
            child: const Icon(
              Icons.check,
              color: AppColors.pictonBlueColor,
            ),
          )
        ],
      ),
    );
  }
}
