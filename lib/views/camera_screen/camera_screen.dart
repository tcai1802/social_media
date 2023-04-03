import 'package:flutter/material.dart';
import 'package:social_media/views/camera_screen/widgets/widgets.dart';

class CameraScreen extends StatelessWidget {
  const CameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CameraBodyWidget(),
        CameraAppBarWidget(),
      ],
    );
  }
}
