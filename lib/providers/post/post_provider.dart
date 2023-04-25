import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:social_media/api/api.dart';
import 'package:social_media/models/post/post_model.dart';

class PostProvider extends ChangeNotifier {
  List<PostModel> postModelList = <PostModel>[];

  Future<void> handleLikeOrNotPost() async {}

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
