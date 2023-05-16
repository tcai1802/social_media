import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:social_media/api/api.dart';
import 'package:social_media/models/models.dart';
import 'package:social_media/models/post/post_model.dart';
import 'package:social_media/models/user/user_hive.dart';
import 'package:social_media/providers/login/login_provider.dart';

class PostProvider extends ChangeNotifier {
  List<PostModel> postModelList = <PostModel>[];
  bool isLoading = false;

  Future<void> intData(context) async {}

  Future<void> handleLikeOrNotPost(context, {required String targetId}) async {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    var box = await Hive.openBox("myBox");
    //UserHive user = box.get("me");
    print("User ===${loginProvider.currentUser?.userId}");
    Response? res = await PostApi().favoritePostApi({
      "user_id": loginProvider.currentUser?.userId,
      "target_id": targetId,
    }, targetId);
    if (res != null && res.data["code"] == "successfully") {
      //print("Result: ${res?.data}");
    } else {
      //print("Result: ${res?.data}");
    }
  }

  Future<List<FavoriteModel>?> handleShowFavoritePost(
      {required String postId}) async {
    Response? res = await PostApi().showFavoritePostApi(postId);
    if (res != null && res.data["code"] == "successfully") {
      //print("Result: ${res?.data}");
      List<FavoriteModel> favoriteList = [];
      for (var item in res.data["data"]) {
        favoriteList.add(FavoriteModel.fromJson(item));
      }
      //print("===${favoriteList}");
      return favoriteList;
    } else {
      return [];
    }
  }

  Future<void> handleShowAllPost(context) async {
    final provider = Provider.of<LoginProvider>(context, listen: false);
    //print("=====${provider.currentUser?.userId}");
    isLoading = true;
    notifyListeners();
    Response? res = await PostApi().showAllPostApi(
        inputHeader: {"Authorization": "JWT ${provider.currentUser?.token}"});
    //print("==${res?.data}");
    if (res != null && res.data["code"] == "successfully") {
      postModelList.clear();
      for (var data in res.data["data"]) {
        postModelList.add(PostModel.fromJson(data));
      }
    }
    isLoading = false;
    notifyListeners();
  }
}
