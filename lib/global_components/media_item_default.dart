import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_media/constants/index.dart';

class MediaItemDefault extends StatelessWidget {
  const MediaItemDefault({
    super.key,
    required this.imageUrl,
    required this.mediaType,
  });
  final String imageUrl;
  final MediaType mediaType;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
        ),
        Positioned(
          right: 10.h,
          top: 10.h,
          child: SvgPicture.asset(
            mediaType == MediaType.video
                ? AppIcons.reelOnIcon
                : AppIcons.galleryIcon,
            height: 16.h,
          ),
        ),
      ],
    );
  }
}