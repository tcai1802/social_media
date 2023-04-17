import 'package:social_media/constants/index.dart';
import 'package:social_media/utils/enum_convert.dart';

class PostModel {
  String? post_id;
  List<String>? mediaList = [];
  PostModel({
    this.post_id,
    this.mediaList,
  });
  PostModel.fromJson(Map<String, dynamic> json) {
    post_id = json["id"];
    mediaList = json["media_list"];
  }
}
