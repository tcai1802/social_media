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
    return UserHive(
      userId: reader.read(),
      userName: reader.read(),
      avatarUrl: reader.read(),
      token: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, UserHive obj) {
    writer.write(obj.userId);
    writer.write(obj.userName);
    writer.write(obj.avatarUrl);
    writer.write(obj.token);
  }
}
