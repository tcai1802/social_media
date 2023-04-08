import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/global_components/index.dart';
import 'package:social_media/providers/providers.dart';
import 'package:social_media/views/index.dart';

class CameraBodyWidget extends StatefulWidget {
  const CameraBodyWidget({super.key});

  @override
  State<CameraBodyWidget> createState() => _CameraBodyWidgetState();
}

class _CameraBodyWidgetState extends State<CameraBodyWidget> {
  //late CameraController controller;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<CameraProvider>(context, listen: false).initCamera();
      //if (mounted) {
      //  setState(() {});
      //}
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CameraProvider>(
      builder: (context, value, child) {
        return Stack(
          fit: StackFit.expand,
          children: [
            value.controller != null && value.controller!.value.isInitialized
                ? CameraPreview(
                    value.controller!,
                  )
                : const Center(
                    child: Text("Loading..."),
                  ),
            Align(
              alignment: Alignment.bottomCenter,
              child: RecordButtonDefault(
                second: 10,
                onTap: () => {
                  value.handleCapturePicture(context).then((value) {
                    print(
                      "Value ${value}",
                    );
                    if (value != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  AddPostFormScreen(file: value)));
                    }
                  })
                },
                onPressLong: () => value.handleRecordVideo(),
                onPressEnd: () => value.handleStopRecordVideo(),
              ),
            ),
          ],
        );
      },
    );
  }
}
