import 'package:flutter/material.dart';
import 'package:social_media/views/profile_screen/widgets/widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          HomeAppBarWidget(),
          HomePostsWidget(),
          HomeAppBarWidget()
        ],
      ),
    );
  }
}
