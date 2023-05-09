import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:social_media/constants/icons.dart';
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
          .handleShowAllPost();
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> imageList = [
      "https://thumbs.dreamstime.com/b/beautiful-rain-forest-ang-ka-nature-trail-doi-inthanon-national-park-thailand-36703721.jpg",
      "https://az837918.vo.msecnd.net/publishedimages/articles/1733/en-CA/images/1/free-download-this-stunning-alberta-scene-for-your-device-background-image-L-6.jpg",
    ];
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
          : Center(
              child: Text("Loading..."),
            );
    });
  }
}
