import 'package:flutter/material.dart';
import 'package:social_media/views/edit_profile/widgets/widgets.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: const [
          EditProfileHeaderWidget(),
          EditProfileBodyWidget(),
        ],
      )),
    );
  }
}
