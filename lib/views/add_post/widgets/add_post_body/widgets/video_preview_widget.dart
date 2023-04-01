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
  void didUpdateWidget(covariant VideoPreviewWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.assetEntity.id != widget.assetEntity.id) {
      clearData();
      loadVideo();
    }
  }

  loadVideo() async {
    widget.assetEntity.file.then((value) {
      if (value != null) {
        _controller = VideoPlayerController.file(
          value,
          videoPlayerOptions: VideoPlayerOptions(mixWithOthers: false),
        );

        _controller?.addListener(() {
          if (mounted) {
            setState(() {});
          }
        });
        _controller?.setLooping(false);
        _controller?.initialize().then((value) {
          _controller?.play();
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    loadVideo();
  }

  clearData() {
    if (_controller!.value.isInitialized) {
      _controller?.dispose();
      _controller = null;
    }
  }

  @override
  void dispose() {
    super.dispose();
    clearData();
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
