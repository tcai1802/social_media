import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:social_media/api/api.dart';
import 'package:social_media/config/routes.dart';

class LoginProvider {
  Future<void> handleLogin(context,
      {String userName = "", String password = ""}) async {
    EasyLoading.show(status: 'loading...');
    Map<String, dynamic>? response = await AuthApi().handleLoginApi({
      "user_name": userName,
      "password": password,
    });
    if (response != null && response["code"] == "successfully") {
      Navigator.pushNamed(context, Routes.mainRoute); // navigate to main screen
      EasyLoading.showSuccess("Success");
    } else {
      EasyLoading.showError("Error");
    }
    Future.delayed(
      const Duration(seconds: 2),
      () {
        EasyLoading.dismiss();
      },
    );
  }

  Future<void> handleSignUp(
    context, {
    String? userName,
    String? password,
  }) async {
    EasyLoading.show(status: 'loading...');
    Map<String, dynamic>? response = await AuthApi().handleSignUpApi({
      "user_name": userName,
      "password": password,
    });
    if (response != null) {
      if (response["code"] == "successfully") {
        Navigator.pushNamed(
            context, Routes.loginRoute); // navigate to main screen
        EasyLoading.showSuccess(response["code"]);
      } else {
        EasyLoading.showError(response["code"]);
      }
    }
    Future.delayed(
      const Duration(seconds: 2),
      () {
        EasyLoading.dismiss();
      },
    );
  }
}
