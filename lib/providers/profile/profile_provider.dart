import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  final int _currentIndexTab = 0;
  int get currentIndexTab => _currentIndexTab;
  set currentIndexTab(int value) {
    currentIndexTab = value;
  }
}

