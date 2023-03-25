import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_media/constants/index.dart';
import 'package:social_media/global_components/index.dart';

class AddPostBodyWidget extends StatelessWidget {
  const AddPostBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            automaticallyImplyLeading: false,
            collapsedHeight: 500.h,
            pinned: false,
            forceElevated: innerBoxIsScrolled,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                height: 200,
                color: Colors.red,
                child: Image.network(
                  "https://i.pinimg.com/474x/e6/c3/c2/e6c3c2d7de3c2a5ecf7a08a45025c2ee.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ];
      },
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 13.h),
            //height: 50.h,
            child: Row(
              children: [
                Text(
                  "Library",
                  style:
                      TextStyle(fontWeight: FontWeight.w700, fontSize: 14.sp),
                ),
                Icon(Icons.keyboard_arrow_down_sharp),
                const Spacer(),
                CircleWithIconDefault(
                  iconUrl: AppIcons.chooseMultipleIcon,
                  onTap: () {},
                ),
                SizedBox(width: 15.w),
                CircleWithIconDefault(
                  iconUrl: AppIcons.cameraIcon,
                  onTap: () {},
                )
              ],
            ),
          ),
          Expanded(
            child: GridView.custom(
              gridDelegate: SliverQuiltedGridDelegate(
                crossAxisCount: 3,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                repeatPattern: QuiltedGridRepeatPattern.inverted,
                pattern: const [
                  QuiltedGridTile(1, 1),
                  QuiltedGridTile(1, 1),
                  QuiltedGridTile(1, 1),
                  QuiltedGridTile(1, 1),
                  QuiltedGridTile(1, 1),
                  QuiltedGridTile(1, 1),
                ],
              ),
              childrenDelegate: SliverChildBuilderDelegate(
                childCount: 20,
                (context, index) => MediaItemDefault(
                  imageUrl:
                      "https://i.pinimg.com/474x/e6/c3/c2/e6c3c2d7de3c2a5ecf7a08a45025c2ee.jpg",
                  mediaType: MediaType.non,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
