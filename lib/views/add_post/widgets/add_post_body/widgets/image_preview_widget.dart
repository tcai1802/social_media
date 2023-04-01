import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_view/photo_view.dart';

class ImagePreviewWidget extends StatelessWidget {
  const ImagePreviewWidget({
    super.key,
    required this.data,
  });

  final AssetEntity data;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: data.thumbnailDataWithSize(
        ThumbnailSize(data.width, data.height),
      ),
      builder: (BuildContext context, AsyncSnapshot<Uint8List?> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return PhotoView(
            backgroundDecoration:
                const BoxDecoration(color: Colors.transparent),
            imageProvider: MemoryImage(snapshot.data!),
            initialScale: PhotoViewComputedScale.contained,
          );
        }

        return Container();
      },
    );
  }
}
