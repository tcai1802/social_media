import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:provider/provider.dart';
import 'package:social_media/providers/providers.dart';
import 'package:social_media/views/add_screen/widgets/widgets.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AddPostProvider addPostProvider =
        Provider.of<AddPostProvider>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          const AddScreenBodyWidget(),
          Positioned(
            bottom: 20.h,
            right: 0,
            left: 0,
            child: const AddOptionsWidget(),
          ),
          if (context.watch<AddPostProvider>().currentScreenBody ==
              AddPostScreenType.camera)
            Positioned(
              bottom: 20.h,
              left: 20.w,
              child: InkWell(
                onTap: () {
                  addPostProvider.currentScreenBody = AddPostScreenType.gallery;
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2.h),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: addPostProvider.currentMediaList.isNotEmpty
                        ? FutureBuilder(
                            future: addPostProvider.currentMediaList[0]
                                .thumbnailDataWithSize(ThumbnailSize(
                              addPostProvider.currentMediaList[0].width,
                              addPostProvider.currentMediaList[0].height,
                            )),
                            builder: (BuildContext context,
                                AsyncSnapshot<Uint8List?> snapshot) {
                              if (snapshot.hasData &&
                                  snapshot.connectionState ==
                                      ConnectionState.done) {
                                return snapshot.data != null
                                    ? Image.memory(
                                        snapshot.data!,
                                        fit: BoxFit.cover,
                                      )
                                    : Container();
                              }
                              return Container();
                            },
                          )
                        : Container(),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
