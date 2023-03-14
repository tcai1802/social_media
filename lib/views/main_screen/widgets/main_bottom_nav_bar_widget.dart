import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_media/constants/index.dart';

class MainBottomNavBarWidget extends StatefulWidget {
  const MainBottomNavBarWidget({super.key});

  @override
  State<MainBottomNavBarWidget> createState() => _MainBottomNavBarWidgetState();
}

class _MainBottomNavBarWidgetState extends State<MainBottomNavBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 11.h, bottom: 16.h),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Color(0xFF262626)),
        ),
      ),
      child: Row(
        children: [
          _navBarBottomItem(AppIcons.homeOffIcon, AppIcons.homeOnIcon),
          _navBarBottomItem(AppIcons.searchOffIcon, AppIcons.searchOnIcon),
          _navBarBottomItem(AppIcons.addIcon, AppIcons.addIcon),
          _navBarBottomItem(AppIcons.reelOffIcon, AppIcons.reelOnIcon),
          _navBarBottomItem(
            AppIcons.reelOnIcon,
            AppIcons.reelOffIcon,
            widgetCustom: ClipRRect(
              borderRadius: BorderRadius.circular(50.r),
              child: Image.asset(
                AppIcons.logoIcon,
                height: 24.h,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _navBarBottomItem(
    String iconOffUrl,
    String iconOnUrl, {
    bool? isEnable = false,
    Widget? widgetCustom,
  }) {
    return Expanded(
      child: widgetCustom ??
          SvgPicture.asset(
            isEnable! ? iconOnUrl : iconOffUrl,
            height: 24.h,
            width: 24.h,
          ),
    );
  }
}
