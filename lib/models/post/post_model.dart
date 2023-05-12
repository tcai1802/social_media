import 'package:social_media/constants/index.dart';
import 'package:social_media/utils/enum_convert.dart';

class PostModel {
  String? post_id;
  List<dynamic>? mediaList = [];
  String? user_id;
  String? caption;
  PostModel({
    this.post_id,
    this.mediaList,
    this.caption,
    this.user_id,
  });
  PostModel.fromJson(Map<String, dynamic> json) {
    post_id = json["post_id"];
    mediaList = json["media_list"];
    caption = json["caption"];
    user_id = json["user_id"];
  }

  Map<String, dynamic> toJson() => {
        "caption": caption,
        "photos": mediaList,
      };
}
