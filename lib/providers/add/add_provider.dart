import 'package:flutter/material.dart';
import 'package:social_media/constants/index.dart';

class AddProvider extends ChangeNotifier {
  AddTypeEnum _currentScreen = AddTypeEnum.post;
  set currentScreen(AddTypeEnum value) {
    _currentScreen = value;
    notifyListeners();
  }

  AddTypeEnum get currentScreen => _currentScreen;
}
