import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/providers/providers.dart';
import 'package:social_media/views/add_post/widgets/widgets.dart';
import 'package:social_media/views/index.dart';

class AddPostFormScreen extends StatefulWidget {
  const AddPostFormScreen({super.key, required this.file});
  final XFile file;
  @override
  State<AddPostFormScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostFormScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.file(File(widget.file.path)),
    );
  }
}
