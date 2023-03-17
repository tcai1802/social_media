import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:social_media/constants/enum.dart';
import 'package:social_media/constants/index.dart';
import 'package:social_media/providers/providers.dart';

class MainBottomNavBarWidget extends StatefulWidget {
  const MainBottomNavBarWidget({super.key});

  @override
  State<MainBottomNavBarWidget> createState() => _MainBottomNavBarWidgetState();
}

class _MainBottomNavBarWidgetState extends State<MainBottomNavBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context, value, child) => Container(
        decoration: BoxDecoration(
          color: value.currentScreen == BottomNavbarEnum.home
              ? Colors.white
              : Colors.black,
          border: const Border(
            top: BorderSide(color: Color(0xFF262626)),
          ),
        ),
        child: Row(
          children: [
            _navBarBottomItem(
              AppIcons.homeOffIcon,
              AppIcons.homeOnIcon,
              isEnable: value.currentScreen == BottomNavbarEnum.home,
              onTap: () => value.currentScreen = BottomNavbarEnum.home,
            ),
            _navBarBottomItem(
              AppIcons.searchOffIcon,
              AppIcons.searchOnIcon,
              isEnable: value.currentScreen == BottomNavbarEnum.search,
              onTap: () => value.currentScreen = BottomNavbarEnum.search,
            ),
            _navBarBottomItem(
              AppIcons.addIcon,
              AppIcons.addIcon,
              isEnable: value.currentScreen == BottomNavbarEnum.add,
              onTap: () => value.currentScreen = BottomNavbarEnum.add,
            ),
            _navBarBottomItem(
              AppIcons.reelOffIcon,
              AppIcons.reelOnIcon,
              isEnable: value.currentScreen == BottomNavbarEnum.reels,
              onTap: () => value.currentScreen = BottomNavbarEnum.reels,
            ),
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
              isEnable: value.currentScreen == BottomNavbarEnum.profile,
              onTap: () => value.currentScreen = BottomNavbarEnum.profile,
            ),
          ],
        ),
      ),
    );
  }

  _navBarBottomItem(
    String iconOffUrl,
    String iconOnUrl, {
    bool? isEnable = false,
    Widget? widgetCustom,
    Function? onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: () => onTap != null ? onTap() : () {},
        child: Padding(
          padding: EdgeInsets.only(top: 11.h, bottom: 16.h),
          child: widgetCustom ??
              SvgPicture.asset(
                isEnable! ? iconOnUrl : iconOffUrl,
                height: 24.h,
                width: 24.h,
              ),
        ),
      ),
    );
  }
}
