import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:social_media/constants/index.dart';
import 'package:social_media/models/user/user_hive.dart';

class CommentApi {
  Future<Response?> addCommentApi(
      Map<String, dynamic> inputData, String targetId) async {
    Uri uriPath =
        Uri.https(dotenv.env["URL_MAIN"]!, "${ApiPath.comments}/$targetId");
    final dio = Dio();
    var box = await Hive.openBox("test");
    UserHive user = box.getAt(0);
    try {
      return await dio.postUri(
        uriPath,
        data: inputData,
        options: Options(
          headers: {"Authorization": "JWT ${user.token}"},
        ),
      );
    } catch (e) {
      return null;
    }
  }
}
