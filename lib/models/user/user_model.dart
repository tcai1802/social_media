import 'package:social_media/constants/index.dart';

class UserModel {
  String? userId;
  String? userName;
  String? fullName;
  String? avatarUrl;
  String? token;
  String? password;
  String? createdAt;
  String? updatedAt;
  String? mediaUrl;
  UserModel({
    this.userId,
    this.userName,
    this.fullName,
    this.password,
    this.avatarUrl,
    this.token,
    this.createdAt,
    this.updatedAt,
    this.mediaUrl,
  });
  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json["user_id"];
    userName = json["user_name"];
    fullName = json["full_name"];
    mediaUrl = json["mediaUrl"];
    avatarUrl = json["avatar_url"];
    token = json["token"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() => {"full_name": fullName};
}
