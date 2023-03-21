import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/constants/enum.dart';
import 'package:social_media/providers/add/add_provider.dart';
import 'package:social_media/views/index.dart';

class AddScreenBodyWidget extends StatelessWidget {
  const AddScreenBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AddProvider>(
      builder: (context, value, child) {
        switch (value.currentScreen) {
          case AddTypeEnum.post:
            return const AddPostScreen();
          case AddTypeEnum.story:
            return const AddStoryScreen();
          case AddTypeEnum.reel:
            return const AddReelScreen();
          case AddTypeEnum.live:
            return const AddLiveScreen();
        }
      },
    );
  }
}
