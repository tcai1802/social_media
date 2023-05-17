import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:social_media/api/api.dart';
import 'package:social_media/api/user/user_api.dart';
import 'package:social_media/models/models.dart';
import 'package:social_media/models/user/user_hive.dart';
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
      {required Map<String, dynamic> data, required String userId}) async {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    EasyLoading.show(status: 'Uploadig...');
    try {
      var result = await _userApi.editUserApi(
          userId,
          data,
          Options(
            headers: {
              "Authorization": "JWT ${loginProvider.currentUser?.token}"
            },
          ));
      if (result != null) {

        EasyLoading.showSuccess("OK");
      }
    } catch (e) {
      EasyLoading.showSuccess("Error $e");

      return null;
    }
    //return null;
  }
}
