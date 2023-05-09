import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:social_media/constants/api_path.dart';

class AuthApi {
  Future<Map<String, dynamic>?> handleLoginApi(
    Map<String, dynamic> inputData,
  ) async {
    var loginUri = Uri.https(dotenv.env["URL_MAIN"]!, ApiPath.login);
    var res = await http.post(
      loginUri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(inputData),
    );
    return jsonDecode(res.body);
  }

  Future<Map<String, dynamic>?> handleSignUpApi(
    Map<String, dynamic> inputData,
  ) async {
    var signUpUri = Uri.https(dotenv.env["URL_MAIN"]!, ApiPath.signUp);

    var res = await http.post(
      signUpUri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(inputData),
    );
    return jsonDecode(res.body);
  }
}
