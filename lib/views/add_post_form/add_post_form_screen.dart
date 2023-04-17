import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/providers/providers.dart';
import 'package:social_media/views/add_post_form/widgets/widgets.dart';

class AddPostFormScreen extends StatefulWidget {
  const AddPostFormScreen({super.key});
  @override
  State<AddPostFormScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            AddPostFormAppBar(),
            AddPostFormBody(),
          ],
        ),
      ),
    );
  }
}
