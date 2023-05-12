import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:social_media/constants/index.dart';
import 'package:social_media/models/user/user_hive.dart';

class UserApi {
  Future<Response?> infoUserApi(String userId) async {
    Uri uriPath =
        Uri.https(dotenv.env["URL_MAIN"]!, "${ApiPath.users}/$userId");
    final dio = Dio();
    var box = await Hive.openBox("myBox");
    UserHive user = box.getAt(0);
    try {
      return await dio.getUri(
        uriPath,
        options: Options(
          headers: {"Authorization": "JWT ${user.token}"},
        ),
      );
    } catch (e) {
      return null;
    }
  }
}
