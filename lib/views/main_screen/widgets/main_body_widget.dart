import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:social_media/constants/enum.dart';
import 'package:social_media/providers/providers.dart';
import 'package:social_media/views/home_screen/home_screen.dart';
import 'package:social_media/views/index.dart';

class MainBodyWidget extends StatelessWidget {
  const MainBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(builder: (context, value, child) {
      switch (value.currentScreen) {
        case BottomNavbarEnum.home:
          return const  HomeScreen();
        case BottomNavbarEnum.search:
          return const  SearchScreen();
        case BottomNavbarEnum.add:
          return const  AddScreen();
        case BottomNavbarEnum.reels:
          return const  ReelScreen();
        case BottomNavbarEnum.profile:
          return const  ProfileScreen();
      }
    });
  }
}
