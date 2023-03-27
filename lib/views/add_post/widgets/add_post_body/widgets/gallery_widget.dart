import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:provider/provider.dart';
import 'package:social_media/providers/providers.dart';

class GallleryWidget extends StatelessWidget {
  const GallleryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AddPostProvider value = Provider.of<AddPostProvider>(context);
    return Flexible(
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
        (context, index) => FutureBuilder(
          future: value.currentMediaList[index].thumbnailDataWithSize(
              const ThumbnailSize(200, 200)), //resolution of thumbnail
          builder: (BuildContext context, AsyncSnapshot<Uint8List?> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return InkWell(
                onTap: () => value.handleSelectPhoto(index),
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
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    ));
  }
}
