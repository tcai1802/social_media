import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:social_media/constants/index.dart';
import 'package:social_media/providers/add/add_provider.dart';

class AddOptionsWidget extends StatelessWidget {
  const AddOptionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> addList = [
      {"index": 0, "content": "Post"},
      {"index": 1, "content": "Story"},
      {"index": 2, "content": "Reels"},
      {"index": 3, "content": "Live"}
    ];

    return Consumer<AddProvider>(
      builder: (context, value, child) {
        return CarouselSlider(
          options: CarouselOptions(
            height: 40,
            enableInfiniteScroll: false,
            viewportFraction: 0.4,
            reverse: false,
            onPageChanged: (index, reason) {
              switch (index) {
                case 0:
                  value.currentScreen = AddTypeEnum.post;
                  break;
                case 1:
                  value.currentScreen = AddTypeEnum.story;
                  break;
                case 2:
                  value.currentScreen = AddTypeEnum.reel;
                  break;
                case 3:
                  value.currentScreen = AddTypeEnum.live;
                  break;
              }
            },
          ),
          items: addList.map((element) {
            return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(
                  vertical: 10.h,
                  horizontal: 10.h,
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.8),
                  borderRadius: BorderRadius.only(
                    topLeft: element["index"] == 0
                        ? const Radius.circular(50)
                        : Radius.zero,
                    bottomLeft: element["index"] == 0
                        ? const Radius.circular(50)
                        : Radius.zero,
                    topRight: element["index"] == addList.length - 1
                        ? const Radius.circular(50)
                        : Radius.zero,
                    bottomRight: element["index"] == addList.length - 1
                        ? const Radius.circular(50)
                        : Radius.zero,
                  ),
                ),
                child: Text(
                  '${element["content"]}',
                  style: TextStyle(fontSize: 16.sp, color: Colors.white),
                ));
          }).toList(),
        );
      },
    );
  }
}
