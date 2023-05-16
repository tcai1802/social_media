import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:social_media/constants/index.dart';
import 'package:social_media/global_components/index.dart';
import 'package:social_media/providers/search/search_provider.dart';
import 'package:social_media/views/search_screen/components/components.dart';

class SearchBodyWidget extends StatefulWidget {
  const SearchBodyWidget({super.key});

  @override
  State<SearchBodyWidget> createState() => _SearchBodyWidgetState();
}

class _SearchBodyWidgetState extends State<SearchBodyWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<SearchProvider>(context, listen: false)
          .handleShowAllPost(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(builder: (context, value, child) {
      return !value.isLoading
          ? context.watch<SearchProvider>().searchingType == SearchType.none
              ? GridView.custom(
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
                    childCount: value.postHintList.length,
                    (context, index) => MediaItemDefault(
                      imageUrl: value.postHintList[index].mediaList?[0],
                      mediaType: MediaType.image,
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: value.userList.length,
                  itemBuilder: (context, index) => SearchUserItem(
                    userModel: value.userList[index],
                  ),
                )
          : Center(
              child: LoadingAnimationWidget.inkDrop(
                color: AppColors.pictonBlueColor,
                size: 40.sp,
              ),
            );
    });
  }
}
