import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class AddPostProvider extends ChangeNotifier {
  String _currentAsset = "";
  set currentAsset(String value) => _currentAsset = value;
  String get currentAsset => _currentAsset;

  // other function
  int _selectedPhotoIndex = 0;
  set selectedPhotoIndex(int selectedPhotoIndex) =>
      _selectedPhotoIndex = selectedPhotoIndex;
  int get selectedPhotoIndex => _selectedPhotoIndex;

  final List<AssetEntity> _currentMediaList = [];
  set currentMediaList(List<AssetEntity> mediaList) {
    _currentMediaList.addAll(mediaList);
  }

  List<AssetEntity> get currentMediaList => _currentMediaList;

  Future<void> handleGetImageListInFolder() async {
    final PermissionState _ps = await PhotoManager.requestPermissionExtend();
    if (_ps.isAuth) {
      // Granted.
      final List<AssetPathEntity> paths = await PhotoManager.getAssetPathList();
      if (paths.isNotEmpty) {
        currentAsset = paths[1].name; // assign first folder asset
      }
      currentMediaList.clear();
      currentMediaList = await paths[1]
          .getAssetListPaged(size: 60, page: 0); //preloading files
      notifyListeners();
    } else {}
  }

  // select photo
  Future<void> handleSelectPhoto(int index) async {
    if (index != selectedPhotoIndex) {
      selectedPhotoIndex = index;
      notifyListeners();
    }
  }
}
