import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:provider/provider.dart';
import 'package:social_media/constants/index.dart';
import 'package:social_media/global_components/index.dart';
import 'package:social_media/providers/providers.dart';
import 'package:social_media/views/add_post/components/components.dart';
import 'package:social_media/views/add_post/widgets/add_post_body/widgets/widgets.dart';
import 'package:social_media/views/add_post/widgets/widgets.dart';

class GalleryWidgetBody extends StatefulWidget {
  const GalleryWidgetBody({super.key});

  @override
  State<GalleryWidgetBody> createState() => _GalleryWidgetBodyState();
}

class _GalleryWidgetBodyState extends State<GalleryWidgetBody> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AddPostProvider>(
      builder: (context, value, child) => Column(
        children: [
          GalleryAppBar(),
          Expanded(
            child: NestedScrollView(
              floatHeaderSlivers: true,
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
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
                          ? value.currentMediaList[value.selectedPhotoIndex]
                                      .type !=
                                  AssetType.video
                              ? ImagePreviewWidget(
                                  data: value.currentMediaList[
                                      value.selectedPhotoIndex],
                                )
                              : VideoPreviewWidget(
                                  assetEntity: value.currentMediaList[
                                      value.selectedPhotoIndex],
                                )
                          : const Center(child: Text('Loading...')),
                    ),
                  ),
                ];
              },
              body: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 18.w, vertical: 13.h),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () => showMediaFolderListDialog(context),
                          child: Row(
                            children: [
                              Text(
                                value.currentAsset,
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14.sp),
                              ),
                              const Icon(Icons.keyboard_arrow_down_sharp),
                            ],
                          ),
                        ),
                        const Spacer(),
                        CircleWithIconDefault(
                          iconUrl: AppIcons.chooseMultipleIcon,
                          onTap: () {
                            value.handleEnableOrDisableChooseMultiImage();
                          },
                        ),
                        SizedBox(width: 15.w),
                        CircleWithIconDefault(
                          iconUrl: AppIcons.cameraIcon,
                          onTap: () {
                            value.currentScreenBody = AddPostScreenType.camera;
                          },
                        )
                      ],
                    ),
                  ),
                  if (value.currentMediaList.isNotEmpty)
                    const GalleryListWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
