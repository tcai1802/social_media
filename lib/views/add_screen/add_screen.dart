import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media/views/add_screen/widgets/widgets.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          AddScreenBodyWidget(),
          Positioned(
            bottom: 40.h,
            right: 0,
            left: 0,
            child: AddOptionsWidget(),
          )
        ],
      ),
    );
  }
}
