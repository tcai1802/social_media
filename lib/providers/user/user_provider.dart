import 'package:flutter/foundation.dart';
import 'package:social_media/api/user/user_api.dart';
import 'package:social_media/models/models.dart';

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
}
