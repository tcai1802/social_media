import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media/global_components/index.dart';
import 'package:social_media/main.dart';

class CameraBodyWidget extends StatefulWidget {
  const CameraBodyWidget({super.key});

  @override
  State<CameraBodyWidget> createState() => _CameraBodyWidgetState();
}

class _CameraBodyWidgetState extends State<CameraBodyWidget> {
  late CameraController controller;
  @override
  void initState() {
    super.initState();
    controller = CameraController(cameraList[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) return;
      setState(() {});
    }).catchError((err) {
      if (err is CameraException) {
        switch (err.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        controller.value.isInitialized
            ? CameraPreview(
                controller,
              )
            : const Center(
                child: Text("Loading..."),
              ),
        Align(
          alignment: Alignment.bottomCenter,
          child: RecordButtonDefault(
            second: 10,
            onTap: () {},
            onPressLong: () {},
            onPressEnd: () {},
          ),
        )
      ],
    );
  }
}
