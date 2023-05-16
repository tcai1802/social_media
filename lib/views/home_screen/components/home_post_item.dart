import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:social_media/arguments/arguments.dart';
import 'package:social_media/config/routes.dart';
import 'package:social_media/constants/index.dart';
import 'package:social_media/global_components/index.dart';
import 'package:social_media/models/models.dart';
import 'package:social_media/providers/providers.dart';

class HomePostItem extends StatefulWidget {
  const HomePostItem({
    super.key,
    required this.postModel,
  });

  final PostModel postModel;

  @override
  State<HomePostItem> createState() => _HomePostItemState();
}

class _HomePostItemState extends State<HomePostItem> {
  int _currentIndexImage = 0;
  bool isFavorite = false;
  bool isLikedPost = false;
  List<FavoriteModel> favoriteList = [];
  UserModel? userData;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      Provider.of<UserProvider>(context, listen: false)
          .handleGetUserInfo(widget.postModel.user_id!)
          .then((value) {
        userData = value;
        if (mounted) {
          setState(() {});
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> snapshots = FirebaseFirestore.instance
        .collection("favorites")
        .where('target_id', isEqualTo: widget.postModel.post_id)
        .snapshots();

    return Consumer<PostProvider>(builder: (context, myType, child) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.all(10.h),
            child: Row(
              children: [
                UserAvatarDefault(size: 32.h),
                SizedBox(width: 10.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userData?.userName ?? "",
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "",
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
                const Spacer(),
                SvgPicture.asset(AppIcons.moreIcon)
              ],
            ),
          ),
          Stack(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 375.h,
                  viewportFraction: 1,
                  initialPage: _currentIndexImage,
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason) {
                    _currentIndexImage = index;
                    if (mounted) setState(() {});
                  },
                ),
                items: widget.postModel.mediaList!.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return GestureDetector(
                        onDoubleTap: () {
                          if (isFavorite) return;
                          if (!isLikedPost) {
                            myType.handleLikeOrNotPost(context,
                                targetId: widget.postModel.post_id ?? "");
                          }
                          setState(() {
                            isLikedPost = !isLikedPost;
                            isFavorite = true;
                            Future.delayed(
                              const Duration(seconds: 1),
                              () {
                                if (mounted) {
                                  setState(() {
                                    isFavorite = false;
                                  });
                                }
                              },
                            );
                          });
                        },
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            CachedNetworkImage(
                              imageUrl: i,
                              fit: BoxFit.cover,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: AnimatedScale(
                                scale: isFavorite ? 1 : 0,
                                curve: Curves.easeInOut,
                                duration: const Duration(milliseconds: 400),
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.white.withOpacity(0.8),
                                  size: 100.h,
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              Positioned(
                right: 14.h,
                top: 14.h,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.h, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFF121212).withOpacity(.7),
                    borderRadius: BorderRadius.circular(13.r),
                  ),
                  child: Text(
                    "${_currentIndexImage + 1}/${widget.postModel.mediaList!.length}",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 10.h),
            child: Stack(
              children: [
                Row(
                  children: [
                    InkWell(
                        onTap: () {
                          isLikedPost = !isLikedPost;
                          myType.handleLikeOrNotPost(context,
                              targetId: widget.postModel.post_id ?? "");
                          if (mounted) {
                            setState(() {});
                          }
                        },
                        child: isLikedPost
                            ? Icon(
                                Icons.favorite,
                                size: 32.sp,
                                color: Colors.red,
                              )
                            : Icon(
                                Icons.favorite_border_outlined,
                                size: 32.sp,
                              )),
                    SizedBox(width: 16.w),
                    GestureDetector(
                        onTap: () => Navigator.pushNamed(
                            context, Routes.commentRoute,
                            arguments: CommentArgument(
                                widget.postModel.post_id ?? "")),
                        child: SvgPicture.asset(AppIcons.commentIcon)),
                    SizedBox(width: 16.w),
                    SvgPicture.asset(AppIcons.shareIcon),
                    const Spacer(),
                    SvgPicture.asset(AppIcons.bookMarkIcon),
                  ],
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...widget.postModel.mediaList!.map((e) {
                        int index = widget.postModel.mediaList!.indexOf(e);
                        return Container(
                          height: 6.h,
                          width: 6.h,
                          margin: EdgeInsets.symmetric(horizontal: 2.h),
                          decoration: BoxDecoration(
                            color: index == _currentIndexImage
                                ? const Color(0xFF3897F0)
                                : const Color(0xFFD8D8D8),
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                        );
                      })
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 14.h),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StreamBuilder(
                    stream: snapshots,
                    builder: (context, snapshot) {
                      favoriteList.clear();
                      snapshot.data?.docs.forEach(
                        (element) {
                          favoriteList!.add(FavoriteModel.fromJson(
                              element.data() as Map<String, dynamic>));
                        },
                      );
                      isLikedPost = favoriteList.any((element) =>
                          element.user_id ==
                          context.watch<LoginProvider>().currentUser?.userId);

                      return Text(
                        "${snapshot.data?.docs.length ?? 0} ${AppStrings.likes}",
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      );
                    }),
                ReadMoreText(
                  widget.postModel.caption!,
                  trimLines: 1,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: AppStrings.showMore,
                  trimExpandedText: AppStrings.showLess,
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
