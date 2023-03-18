import 'package:flutter/material.dart';
import 'package:social_media/views/search_screen/widgets/widgets.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            SearchHeaderWidget(),
            Expanded(
              child: SearchBodyWidget(),
            )
          ],
        ),
      ),
    );
  }
}
