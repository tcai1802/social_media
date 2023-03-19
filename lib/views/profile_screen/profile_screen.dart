import 'package:flutter/material.dart';
import 'package:social_media/views/profile_screen/widgets/widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ProfileHeaderWidget(),
            ProfileInfoWidget(),
            Expanded(child: ProfileTabBarWidget())
          ],
        ),
      ),
    );
  }
}
