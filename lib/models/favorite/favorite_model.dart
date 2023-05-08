
class FavoriteModel {
  String? user_id;
  String? target_id;
  FavoriteModel({
    this.user_id,
    this.target_id,
  });
  FavoriteModel.fromJson(Map<String, dynamic> json) {
    user_id = json["user_id"];
    target_id = json["target_id"];
  }

  Map<String, dynamic> toJson() => {
        "user_id": user_id,
        "target_id": target_id,
      };
}
