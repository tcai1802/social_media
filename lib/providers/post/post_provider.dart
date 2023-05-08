import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:social_media/api/api.dart';
import 'package:social_media/models/models.dart';
import 'package:social_media/models/post/post_model.dart';

class PostProvider extends ChangeNotifier {
  List<PostModel> postModelList = <PostModel>[];

  Future<void> handleLikeOrNotPost({required String postId}) async {
    Response? res = await PostApi().favoritePostApi({
      "user_id": "6448e36202d68b2317b675eb",
      "target_id": "644aa389236ad19fb8a222b2"
    }, postId);
    if (res != null && res.data["code"] == "successfully") {
      print("Result: ${res?.data}");
    } else {
      print("Result: ${res?.data}");
    }
  }

  Future<List<FavoriteModel>?> handleShowFavoritePost(
      {required String postId}) async {
    Response? res = await PostApi().showFavoritePostApi(postId);
    if (res != null && res.data["code"] == "successfully") {
      print("Result: ${res?.data}");
      List<FavoriteModel> favoriteList = [];
      for (var item in res.data["data"]) {
        favoriteList.add(FavoriteModel.fromJson(item));
      }
      print("===${favoriteList}");
      return favoriteList;
    } else {
      return [];
    }
  }

  Future<void> handleShowAllPost() async {
    Response? res = await PostApi().showAllPostApi();
    if (res != null && res.data["code"] == "successfully") {
      //postModelList.clear();
      for (var data in res.data["data"]) {
        postModelList.add(PostModel.fromJson(data));
      }
    }
    notifyListeners();
  }
}
