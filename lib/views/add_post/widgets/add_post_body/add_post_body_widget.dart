import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import 'package:social_media/constants/index.dart';
import 'package:social_media/global_components/index.dart';
import 'package:social_media/providers/providers.dart';
import 'package:social_media/views/add_post/widgets/add_post_body/widgets/video_preview_widget.dart';
import 'package:social_media/views/add_post/widgets/add_post_body/widgets/widgets.dart';

import 'widgets/gallery_widget.dart';

class AddPostBodyWidget extends StatefulWidget {
  const AddPostBodyWidget({super.key});

  @override
  State<AddPostBodyWidget> createState() => _AddPostBodyWidgetState();
}

class _AddPostBodyWidgetState extends State<AddPostBodyWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<AddPostProvider>(context, listen: false)
          .handleGetImageListInFolder();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AddPostProvider>(
      builder: (context, value, child) => NestedScrollView(
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
                background: value.currentMediaList.isNotEmpty
                    ? FilePreviewWidget()
                    : Container(),
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
                    value.currentAsset,
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 14.sp),
                  ),
                  const Icon(Icons.keyboard_arrow_down_sharp),
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
            GallleryWidget(),
          ],
        ),
      ),
    );
  }
}
