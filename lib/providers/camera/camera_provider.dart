import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:social_media/main.dart';

class CameraProvider extends ChangeNotifier {
  CameraController? controller;
  CameraDescription _currentCamera = cameraList[0];
  set currentCamera(CameraDescription value) => _currentCamera = value;
  CameraDescription get currentCamera => _currentCamera;
  initCamera() async {
    controller = CameraController(currentCamera, ResolutionPreset.max);
    await controller!.initialize();
    //.then((_) {
    //  return;
    //}).catchError((err) {
    //  if (err is CameraException) {
    //    switch (err.code) {
    //      case 'CameraAccessDenied':
    //        // Handle access errors here.
    //        break;
    //      default:
    //        // Handle other errors here.
    //        break;
    //    }
    //  }
    //});
    notifyListeners();
  }

  // capturePicture handle
  Future<XFile?> handleCapturePicture(context) async {
    if (controller == null || !controller!.value.isInitialized) {
      return null;
    }
    if (controller!.value.isTakingPicture) {
      return null;
    }
    try {
      XFile file = await controller!.takePicture();
      return file;
    } on CameraException catch (e) {
      print("Error== $e");
    }
  }

  Future<void> handleRecordVideo() async {}

  Future<void> handleStopRecordVideo() async {}
  Future<void> handleChangeCamera() async {
    print("Tapp====");
    if (currentCamera == cameraList[0]) {
      currentCamera = cameraList[1];
    } else {
      currentCamera = cameraList[0];
    }
    //controller!.dispose();
    await initCamera();
  }
}
