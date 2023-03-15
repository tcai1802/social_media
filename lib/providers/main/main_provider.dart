import 'package:flutter/material.dart';
import 'package:social_media/constants/enum.dart';

class MainProvider with ChangeNotifier {
  BottomNavbarEnum _currentScreen = BottomNavbarEnum.home;
  set currentScreen(BottomNavbarEnum value) {
    _currentScreen = value;
    notifyListeners();
  }

  BottomNavbarEnum get currentScreen => _currentScreen;

}
