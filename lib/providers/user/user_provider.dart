import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:social_media/api/api.dart';
import 'package:social_media/api/user/user_api.dart';
import 'package:social_media/models/models.dart';
import 'package:social_media/providers/login/login_provider.dart';
import 'package:social_media/providers/providers.dart';
import 'package:social_media/providers/providers.dart';

class UserProvider extends ChangeNotifier {
  final UserApi _userApi = UserApi();
  Future<UserModel?> handleGetUserInfo(String userId) async {
    try {
      var result = await _userApi.infoUserApi(userId);
      if (result != null) {
        UserModel userData = UserModel.fromJson(result.data["data"]);
        //print("data===${userData.userName}");
        return userData;
      }
    } catch (e) {
      return null;
    }
    //return null;
  }

  Future<UserModel?> handleUpdateUserInfo(context,
      {required String userId}) async {
    final loginProvider = Provider.of(context, listen: false);
    try {
      var result = await _userApi.editUserApi(
          userId,
          Options(
            headers: {
              "Authorization": "JWT ${loginProvider.currentUser?.token}"
            },
          ));
      if (result != null) {
        UserModel userData = UserModel.fromJson(result.data["data"]);
        return userData;
      }
    } catch (e) {
      return null;
    }
    //return null;
  }
}
