import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/providers/providers.dart';
import 'package:social_media/views/add_post/widgets/widgets.dart';
import 'package:social_media/views/index.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<AddPostProvider>(context, listen: false)
          .handleGetImageListInFolder();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AddPostProvider>(builder: (context, value, child) {
      return Scaffold(
        body: SafeArea(
          child: !value.isLoading
              ? value.currentScreenBody == AddPostScreenType.camera
                  ? CameraScreen() // camera screen
                  : GalleryWidgetBody() // gallery screen
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      );
    });
  }
}
