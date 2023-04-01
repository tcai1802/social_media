import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:social_media/providers/providers.dart';
import 'package:social_media/views/add_post/widgets/widgets.dart';

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
      print("Calll");
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
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    AddPostAppBarWidget(),
                    Expanded(child: AddPostBodyWidget()),
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      );
    });
  }
}
