import 'package:flutter/material.dart';
import 'package:social_media/views/home_screen/home_screen.dart';
import 'package:social_media/views/main_screen/widgets/widgets.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          HomeScreen(),
          Align(
            alignment: Alignment.bottomCenter,
            child: MainBottomNavBarWidget(),
          )
        ],
      ),
    );
  }
}
