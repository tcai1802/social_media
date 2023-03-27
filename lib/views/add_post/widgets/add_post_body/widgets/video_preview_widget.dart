import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:video_player/video_player.dart';

class VideoPreviewWidget extends StatefulWidget {
  const VideoPreviewWidget({super.key, required this.assetEntity});
  final AssetEntity assetEntity;
  @override
  State<VideoPreviewWidget> createState() => _VideoPreviewWidgetState();
}

class _VideoPreviewWidgetState extends State<VideoPreviewWidget> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    widget.assetEntity.file.then((value) {
      if (value != null) {
        print("==== ${value.path}");
        _controller = VideoPlayerController.file(
          value,
          videoPlayerOptions: VideoPlayerOptions(mixWithOthers: false),
        );

        _controller?.addListener(() {
          if (mounted) {
            setState(() {});
          }
        });
        _controller?.setLooping(true);
        _controller?.initialize().then((value) {
          _controller?.play();
        });
      }
    });
  }

  @override
  void dispose() {
    _controller?.pause();

    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller != null
        ? Stack(
            children: <Widget>[
              SizedBox.expand(
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: SizedBox(
                    width: _controller!.value.size.width,
                    height: _controller!.value.size.height,
                    child: VideoPlayer(_controller!),
                  ),
                ),
              ),
            ],
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }
}
