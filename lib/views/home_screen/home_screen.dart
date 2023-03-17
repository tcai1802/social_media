import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media/views/home_screen/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const HomeAppBarWidget(),
          Expanded(
            child: Column(
              children: [
                const HomeStoriesWidget(),
                const Flexible(
                  child: HomePostsWidget(),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          )
        ],
      ),
    );
  }
}
