import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:social_media/constants/index.dart';
import 'package:social_media/global_components/index.dart';
import 'package:social_media/providers/providers.dart';

class ProfileTabBarWidget extends StatelessWidget {
  const ProfileTabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          SizedBox(height: 15.h),
          TabBar(
            tabs: [
              Tab(
                child: SvgPicture.asset(
                  AppIcons.gridIcon,
                  height: 23.h,
                ),
              ),
              Tab(
                child: SvgPicture.asset(
                  AppIcons.tagsIcon,
                ),
              )
            ],
            indicatorColor: Colors.black,
            indicatorWeight: 1,
            onTap: (value) async {},
          ),
          SizedBox(height: 10.h),
          Expanded(
            child: TabBarView(children: [
              GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                ),
                itemBuilder: (context, index) {
                  return const MediaItemDefault(
                    imageUrl:
                        "https://i.pinimg.com/736x/c9/6d/58/c96d58c799f674a0cb3a52fb0e7e411a.jpg",
                    mediaType: MediaType.image,
                  );
                },
              ),
              GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                ),
                itemBuilder: (context, index) {
                  return const MediaItemDefault(
                    imageUrl:
                        "https://i.pinimg.com/736x/c9/6d/58/c96d58c799f674a0cb3a52fb0e7e411a.jpg",
                    mediaType: MediaType.image,
                  );
                },
              ),
            ]),
          )
        ],
      ),
    );
  }
}
