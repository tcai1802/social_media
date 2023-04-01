import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:provider/provider.dart';
import 'package:social_media/providers/providers.dart';

class GalleryWidget extends StatefulWidget {
  const GalleryWidget({
    super.key,
  });

  @override
  State<GalleryWidget> createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AddPostProvider>(builder: (context, value, child) {
      return value.currentMediaList.isNotEmpty
          ? Flexible(
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
                  ],
                ),
                childrenDelegate: SliverChildBuilderDelegate(
                  childCount: value.currentMediaList.length,
                  (context, index) {
                    return FutureBuilder(
                      future: value.currentMediaList[index]
                          .thumbnailDataWithSize(ThumbnailSize(
                        value.currentMediaList[index].width,
                        value.currentMediaList[index].height,
                      )),
                      builder: (BuildContext context,
                          AsyncSnapshot<Uint8List?> snapshot) {
                        if (snapshot.hasData &&
                            snapshot.connectionState == ConnectionState.done) {
                          return snapshot.data != null
                              ? _galleyItem(value, index, snapshot)
                              : Container();
                        }
                        return Container();
                      },
                    );
                  },
                ),
              ),
            )
          : Container();
    });
  }

  _galleyItem(
      AddPostProvider value, int index, AsyncSnapshot<Uint8List?> snapshot) {
    return InkWell(
      onTap: () => value.handleSelectPhoto(
        index,
        chooseMulti: value.chooseMultipleImage,
      ),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Image.memory(
              snapshot.data!,
              fit: BoxFit.cover,
            ),
          ),
          if (value.currentMediaList[index].type == AssetType.video)
            const Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(right: 5, bottom: 5),
                child: Icon(
                  Icons.videocam,
                  color: Colors.white,
                ),
              ),
            ),
          if (index == value.selectedPhotoIndex)
            Positioned.fill(
              child: Container(
                color: Colors.grey.withOpacity(0.5),
              ),
            ),
          if (value.chooseMultipleImage &&
              value.getMediaIndexList.contains(index))
            Positioned(
              right: 8.h,
              top: 8.h,
              child: Container(
                height: 24.h,
                width: 24.h,
                padding: EdgeInsets.all(4.h),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.white),
                ),
                child: Center(
                    child: Text(
                  "${value.getMediaIndexList.indexOf(index) + 1}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                )),
              ),
            ),
        ],
      ),
    );
  }
}
