import 'package:flutter/material.dart';
import 'package:social_media/views/main_screen/widgets/widgets.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: const [
          Expanded(child: MainBodyWidget()),
          MainBottomNavBarWidget(),
        ],
      ),
    );
  }
}
