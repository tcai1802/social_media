import 'package:social_media/constants/index.dart';
import 'package:social_media/models/models.dart';

class EnumConvert {
  MediaType handleConvertMediaTypeToEnum(String? data) {
    if (data != null) {
      switch (data) {
        case ("image"):
          return MediaType.image;
        case ("video"):
          return MediaType.video;
        default:
          return MediaType.non;
      }
    }
    return MediaType.non;
  }
}
