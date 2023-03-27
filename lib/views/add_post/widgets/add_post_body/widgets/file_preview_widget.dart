import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import 'package:social_media/providers/providers.dart';
import 'package:social_media/views/add_post/widgets/add_post_body/widgets/video_preview_widget.dart';

class FilePreviewWidget extends StatelessWidget {
  const FilePreviewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AddPostProvider value = Provider.of<AddPostProvider>(context);

    return value.currentMediaList[value.selectedPhotoIndex].type !=
            AssetType.video
        ? FutureBuilder(
            future: value.currentMediaList[value.selectedPhotoIndex]
                .thumbnailDataWithSize(
              const ThumbnailSize(1000, 1000),
            ),
            builder:
                (BuildContext context, AsyncSnapshot<Uint8List?> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: PhotoView(
                        imageProvider: MemoryImage(snapshot.data!),
                      ),
                    ),
                  ],
                );
              }

              return Container();
            },
          )
        : VideoPreviewWidget(
            assetEntity: value.currentMediaList[value.selectedPhotoIndex],
          );
  }
}
