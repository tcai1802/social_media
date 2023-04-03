// ignore_for_file: unnecessary_getters_setters

import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

enum AddPostScreenType {
  gallery,
  camera,
}

class AddPostProvider extends ChangeNotifier {
  bool _isLoading = false;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  bool _chooseMultipleImage = false;
  set chooseMultipleImage(bool value) {
    _chooseMultipleImage = value;
    notifyListeners();
  }

  bool get chooseMultipleImage => _chooseMultipleImage;

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

  final List<AssetPathEntity> _pathList = [];
  set pathList(List<AssetPathEntity> mediaList) {
    _pathList.addAll(mediaList);
  }

  List<AssetPathEntity> get pathList => _pathList;

  final List<int> _mediaIndexList = [];
  set mediaIndexList(int value) {
    if (getMediaIndexList.contains(value)) {
      _mediaIndexList.remove(value);
    } else {
      _mediaIndexList.add(value);
    }
  }

  List<int> get getMediaIndexList => _mediaIndexList;

  // current Screen: change screen body
  AddPostScreenType _currentScreenBody = AddPostScreenType.gallery;
  set currentScreenBody(AddPostScreenType value) {
    _currentScreenBody = value;
    notifyListeners();
  }
  AddPostScreenType get currentScreenBody => _currentScreenBody;

  // ========================= Function ========================
  Future<void> clearData() async {
    selectedPhotoIndex = -1;
    pathList.clear();
    currentAsset = "";
  }

  handleEnableOrDisableChooseMultiImage() {
    chooseMultipleImage = !chooseMultipleImage;
    if (chooseMultipleImage) {
      getMediaIndexList.clear();
      mediaIndexList = selectedPhotoIndex;
      notifyListeners();
    }
  }

  Future<bool> requestPermission() async {
    final PermissionState permissionState =
        await PhotoManager.requestPermissionExtend();
    return permissionState.isAuth;
  }

  Future<void> handleGetImageListInFolder() async {
    isLoading = true;
    selectedPhotoIndex = 0;
    mediaIndexList = selectedPhotoIndex;
    pathList.clear();
    bool isAuth = await requestPermission();
    if (isAuth) {
      final List<AssetPathEntity> paths = await PhotoManager.getAssetPathList();
      if (paths.isNotEmpty) {
        for (var data in paths) {
          _pathList.add(data);
        }
        currentAsset = paths[0].name; // assign first folder asset
      }
      currentMediaList.clear();
      //print("Path ${paths[0].name}");
      currentMediaList = await paths[0]
          .getAssetListPaged(size: 60, page: 0); //preloading files
      isLoading = false;
    } else {}
  }

  Future<void> handleSelectMediaFolder(int index) async {
    currentMediaList.clear();
    //notifyListeners();
    chooseMultipleImage = false;
    currentAsset = pathList[index].name;
    currentMediaList = await pathList[index].getAssetListPaged(
      size: 60,
      page: 0,
    ); // get media list
    selectedPhotoIndex = 0;
    getMediaIndexList.clear();
    mediaIndexList = selectedPhotoIndex;
    notifyListeners();
  }

  // select photo
  Future<void> handleSelectPhoto(int index, {bool chooseMulti = false}) async {
    if (index != selectedPhotoIndex || chooseMulti) {
      mediaIndexList = index;

      if (getMediaIndexList.contains(index)) {
        //mediaIndexList = index;
        selectedPhotoIndex = index;
      } else {
        selectedPhotoIndex = getMediaIndexList[getMediaIndexList.length - 1];
      }
      notifyListeners();
    }
  }
}
