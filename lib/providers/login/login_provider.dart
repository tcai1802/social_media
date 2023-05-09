import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hive/hive.dart';
import 'package:social_media/api/api.dart';
import 'package:social_media/config/routes.dart';
import 'package:social_media/models/models.dart';
import 'package:social_media/models/user/user_hive.dart';

class LoginProvider extends ChangeNotifier {
  UserModel? currentUser;

  Future<void> handleLogin(context,
      {String userName = "", String password = ""}) async {
    EasyLoading.show(status: 'loading...');
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userName,
        password: password,
      );
      Map<String, dynamic>? response = await AuthApi().handleLoginApi({
        "user_name": userName,
        "password": password,
      });
      if (response != null && response["code"] == "successfully") {
        EasyLoading.showSuccess("Success");
        currentUser = UserModel.fromJson(response["data"]);
        var box = await Hive.openBox("test");
        box.add(
          UserHive(
              avatarUrl: currentUser?.avatarUrl,
              token: currentUser?.token,
              userId: currentUser?.userId,
              userName: currentUser?.userName),
        );
        UserHive result = box.getAt(0);
        print("=====${result.token!}");
        Navigator.pushNamed(
            context, Routes.mainRoute); // navigate to main screen
      } else {
        EasyLoading.showError("Error");
      }
      Future.delayed(
        const Duration(seconds: 2),
        () {
          EasyLoading.dismiss();
        },
      );
    } on FirebaseAuthException catch (e) {
      EasyLoading.showError(e.message!);
    }
    //print("user ${user}");
  }

  Future<void> handleSignUp(
    context, {
    String? userName,
    String? password,
  }) async {
    EasyLoading.show(status: 'loading...');
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userName!,
        password: password!,
      );
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
    } on FirebaseAuthException catch (e) {
      EasyLoading.showError(e.message!);
    }
  }
}
