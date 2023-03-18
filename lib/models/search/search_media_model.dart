import 'package:social_media/constants/index.dart';
import 'package:social_media/utils/enum_convert.dart';

class SearchMediaModel {
  String? id;
  MediaType? mediaType;
  String? mediaUrl;
  SearchMediaModel({
    this.id,
    this.mediaType,
    this.mediaUrl,
  });
  SearchMediaModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    mediaType = EnumConvert().handleConvertMediaTypeToEnum(json["mediaType"]);
    mediaUrl = json["mediaUrl"];
  }
}
