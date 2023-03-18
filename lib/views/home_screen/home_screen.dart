import 'package:flutter/material.dart';
import 'package:social_media/views/home_screen/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const HomeAppBarWidget(),
          Expanded(
            child: Column(
              children: const [
                HomeStoriesWidget(),
                Flexible(
                  child: HomePostsWidget(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
