import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:social_media/constants/icons.dart';
import 'package:social_media/constants/index.dart';
import 'package:social_media/global_components/user_avatar_default.dart';
import 'package:social_media/providers/providers.dart';
import 'package:social_media/views/home_screen/components/components.dart';

class HomePostsWidget extends StatefulWidget {
  const HomePostsWidget({super.key});

  @override
  State<HomePostsWidget> createState() => _HomePostsWidgetState();
}

class _HomePostsWidgetState extends State<HomePostsWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<PostProvider>(context, listen: false)
          .handleShowAllPost(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PostProvider>(builder: (context, value, child) {
      //print("=== ${value.postModelList}");
      return !value.isLoading
          ? ListView.builder(
              itemCount: value.postModelList.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return HomePostItem(
                  postModel: value.postModelList[index],
                );
              },
            )
          : const Center(
              child: Text(AppStrings.loading),
            );
    });
  }
}
