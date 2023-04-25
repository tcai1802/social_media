import 'package:social_media/constants/index.dart';
import 'package:social_media/utils/enum_convert.dart';

class PostModel {
  String? post_id;
  List<dynamic>? mediaList = [];
  String? user_id;
  String? caption;
  int? total_likes;
  int? total_comments;
  PostModel({
    this.post_id,
    this.mediaList,
    this.caption,
    this.user_id,
    this.total_likes,
    this.total_comments,
  });
  PostModel.fromJson(Map<String, dynamic> json) {
    post_id = json["id"];
    mediaList = json["media_list"];
    caption = json["caption"];
    total_likes = json["total_likes"];
  }

  Map<String, dynamic> toJson() => {
        "total_likes": total_likes,
        "total_comments": total_comments,
      };
}
