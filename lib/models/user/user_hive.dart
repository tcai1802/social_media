import 'package:hive/hive.dart';
import 'package:social_media/models/models.dart';

@HiveType(typeId: 0)
class UserHive extends HiveObject {
  @HiveField(0)
  String? userId;

  @HiveField(1)
  String? userName;

  @HiveField(2)
  String? avatarUrl;

  @HiveField(3)
  String? token;
  //toObject(UserModel data) {
  //  return UserHive()
  //    ..userId = data.userId
  //    ..userName = data.userName
  //    ..avatarUrl = data.avatarUrl
  //    ..token = data.token;
  //}
  UserHive({
    this.userId,
    this.userName,
    this.avatarUrl,
    this.token,
  });
}


class UserHiveAdapter extends TypeAdapter<UserHive> {
  @override
  final typeId = 0;

  @override
  UserHive read(BinaryReader reader) {
    return UserHive()..token = reader.read();
  }

  @override
  void write(BinaryWriter writer, UserHive obj) {
    writer.write(obj.token);
  }
}
