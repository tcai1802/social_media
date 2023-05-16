import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:social_media/constants/index.dart';

class SearchApi {
  Future<Response?> searchUserApi(
      {required String searchInput, required Options inputOptions}) async {
    Uri searchUri = Uri.https(dotenv.env["URL_MAIN"]!,
        "${ApiPath.users}/search", {"word": searchInput});
    print("Uri ${searchUri}");
    final dio = Dio();
    try {
      return await dio.getUri(searchUri, options: inputOptions);
    } catch (e) {
      return null;
    }
  }
}
