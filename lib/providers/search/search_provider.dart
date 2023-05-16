import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/api/api.dart';
import 'package:social_media/constants/index.dart';
import 'package:social_media/models/models.dart';
import 'package:social_media/providers/providers.dart';

class SearchProvider extends ChangeNotifier {
  final SearchApi _searchApi = SearchApi();
  List<PostModel> postHintList = <PostModel>[];
  bool isLoading = false;
  SearchType _searchingType = SearchType.none;
  SearchType get searchingType => _searchingType;
  set searchingType(SearchType value) {
    _searchingType = value;
    notifyListeners();
  }

  List<UserModel> userList = <UserModel>[];

  List<SearchMediaModel> mediaModelList = <SearchMediaModel>[
    SearchMediaModel(
      id: "",
      mediaType: MediaType.image,
      mediaUrl:
          "https://i.pinimg.com/736x/c9/6d/58/c96d58c799f674a0cb3a52fb0e7e411a.jpg",
    ),
    SearchMediaModel(
      id: "",
      mediaType: MediaType.image,
      mediaUrl:
          "https://i.pinimg.com/736x/ad/80/c9/ad80c9c60f8e6b268cb7e729623bf684.jpg",
    ),
    SearchMediaModel(
        id: "",
        mediaType: MediaType.video,
        mediaUrl:
            "https://i.pinimg.com/564x/76/27/f0/7627f0577383d310bf9d938dc98b5a02.jpg"),
    SearchMediaModel(
        id: "",
        mediaType: MediaType.image,
        mediaUrl:
            "https://i.pinimg.com/236x/4e/fc/bf/4efcbf604f7bc3b21624d7f1a72536f2.jpg"),
    SearchMediaModel(
        id: "",
        mediaType: MediaType.video,
        mediaUrl:
            "https://i.pinimg.com/474x/d9/27/9e/d9279e80997a571b0477e3aa0c8625ef.jpg"),
    SearchMediaModel(
        id: "",
        mediaType: MediaType.image,
        mediaUrl:
            "https://i.pinimg.com/236x/e7/90/2d/e7902da99442990a3de221a34b2636c9.jpg"),
    SearchMediaModel(
        id: "",
        mediaType: MediaType.video,
        mediaUrl:
            "https://i.pinimg.com/736x/c9/6d/58/c96d58c799f674a0cb3a52fb0e7e411a.jpg"),
    SearchMediaModel(
        id: "",
        mediaType: MediaType.image,
        mediaUrl:
            "https://i.pinimg.com/236x/e7/90/2d/e7902da99442990a3de221a34b2636c9.jpg"),
    SearchMediaModel(
        id: "",
        mediaType: MediaType.video,
        mediaUrl:
            "https://i.pinimg.com/736x/c9/6d/58/c96d58c799f674a0cb3a52fb0e7e411a.jpg"),
    SearchMediaModel(
        id: "",
        mediaType: MediaType.image,
        mediaUrl:
            "https://i.pinimg.com/736x/c9/6d/58/c96d58c799f674a0cb3a52fb0e7e411a.jpg"),
    SearchMediaModel(
      id: "",
      mediaType: MediaType.image,
      mediaUrl:
          "https://i.pinimg.com/736x/c9/6d/58/c96d58c799f674a0cb3a52fb0e7e411a.jpg",
    ),
    SearchMediaModel(
      id: "",
      mediaType: MediaType.image,
      mediaUrl:
          "https://i.pinimg.com/736x/ad/80/c9/ad80c9c60f8e6b268cb7e729623bf684.jpg",
    ),
    SearchMediaModel(
        id: "",
        mediaType: MediaType.video,
        mediaUrl:
            "https://i.pinimg.com/564x/76/27/f0/7627f0577383d310bf9d938dc98b5a02.jpg"),
    SearchMediaModel(
        id: "",
        mediaType: MediaType.image,
        mediaUrl:
            "https://i.pinimg.com/236x/4e/fc/bf/4efcbf604f7bc3b21624d7f1a72536f2.jpg"),
    SearchMediaModel(
        id: "",
        mediaType: MediaType.video,
        mediaUrl:
            "https://i.pinimg.com/474x/d9/27/9e/d9279e80997a571b0477e3aa0c8625ef.jpg"),
    SearchMediaModel(
        id: "",
        mediaType: MediaType.image,
        mediaUrl:
            "https://i.pinimg.com/236x/e7/90/2d/e7902da99442990a3de221a34b2636c9.jpg"),
    SearchMediaModel(
        id: "",
        mediaType: MediaType.video,
        mediaUrl:
            "https://i.pinimg.com/736x/c9/6d/58/c96d58c799f674a0cb3a52fb0e7e411a.jpg"),
    SearchMediaModel(
        id: "",
        mediaType: MediaType.image,
        mediaUrl:
            "https://i.pinimg.com/236x/e7/90/2d/e7902da99442990a3de221a34b2636c9.jpg"),
    SearchMediaModel(
        id: "",
        mediaType: MediaType.video,
        mediaUrl:
            "https://i.pinimg.com/736x/c9/6d/58/c96d58c799f674a0cb3a52fb0e7e411a.jpg"),
    SearchMediaModel(
        id: "",
        mediaType: MediaType.image,
        mediaUrl:
            "https://i.pinimg.com/736x/c9/6d/58/c96d58c799f674a0cb3a52fb0e7e411a.jpg"),
    SearchMediaModel(
        id: "",
        mediaType: MediaType.image,
        mediaUrl:
            "https://i.pinimg.com/736x/c9/6d/58/c96d58c799f674a0cb3a52fb0e7e411a.jpg")
  ];

  Future<void> handleShowAllPost(context) async {
    final provider = Provider.of<LoginProvider>(context, listen: false);
    //print("=====${provider.currentUser?.userId}");
    isLoading = true;
    notifyListeners();
    Response? res = await PostApi().showAllPostApi(
        inputHeader: {"Authorization": "JWT ${provider.currentUser?.token}"});
    //print("==${res?.data}");
    if (res != null && res.data["code"] == "successfully") {
      postHintList.clear();
      for (var data in res.data["data"]) {
        postHintList.add(PostModel.fromJson(data));
      }
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> handleSearchUser(context, {String inputSearch = ""}) async {
    searchingType = SearchType.user;
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    try {
      var result = await _searchApi.searchUserApi(
          searchInput: inputSearch,
          inputOptions: Options(
            headers: {
              "Authorization": "JWT ${loginProvider.currentUser?.token}"
            },
          ));
      print("Result ${result?.data}");
      if (result?.data != null && result?.data["data"] != null) {
        List<UserModel> users = [];
        for (var element in result?.data["data"]) {
          users.add(UserModel.fromJson(element));
          userList = users;
        }
        print("====${userList.length}");
        notifyListeners();
      }
    } catch (error) {
      rethrow;
    }
  }
}
