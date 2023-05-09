import 'package:flutter/material.dart';
import 'package:social_media/views/profile_screen/widgets/widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

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
