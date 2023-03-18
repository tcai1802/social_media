import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:social_media/constants/index.dart';
import 'package:social_media/providers/providers.dart';
import 'package:social_media/providers/search/search_provider.dart';

class SearchBodyWidget extends StatelessWidget {
  const SearchBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(builder: (context, value, child) {
      return GridView.custom(
        gridDelegate: SliverQuiltedGridDelegate(
          crossAxisCount: 3,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          repeatPattern: QuiltedGridRepeatPattern.inverted,
          pattern: const [
            QuiltedGridTile(1, 1),
            QuiltedGridTile(1, 1),
            QuiltedGridTile(2, 1),
            QuiltedGridTile(1, 1),
            QuiltedGridTile(1, 1),
            QuiltedGridTile(1, 1),
            QuiltedGridTile(1, 1),
            QuiltedGridTile(1, 1),
          ],
        ),
        childrenDelegate: SliverChildBuilderDelegate(
          childCount: value.mediaModelList.length,
          (context, index) => Stack(
            fit: StackFit.expand,
            children: [
              CachedNetworkImage(
                imageUrl: value.mediaModelList[index].mediaUrl!,
                fit: BoxFit.cover,
              ),
              Positioned(
                right: 10.h,
                top: 10.h,
                child: SvgPicture.asset(
                  value.mediaModelList[index].mediaType == MediaType.video
                      ? AppIcons.reelOnIcon
                      : AppIcons.galleryIcon,
                  height: 16.h,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
