class CommentModel {
  String? user_id;
  String? target_id;
  String? content;
  bool? parent;
  String? parent_id;
  String? created_at;
  String? updated_at;
  CommentModel({
    this.user_id,
    this.target_id,
    this.content,
    this.parent,
    this.parent_id,
    this.created_at,
    this.updated_at,
  });
  CommentModel.fromJson(Map<String, dynamic> json) {
    user_id = json["user_id"];
    content = json["content"];
    parent = json["parent"];
    parent_id = json["parent_id"];
    created_at = json["created_at"];
    updated_at = json["updated_at"];
  }

  Map<String, dynamic> toJson() => {
        "user_id": user_id,
        "target_id": target_id,
        "content": content,
        "parent": parent ?? true,
        "parent_id": parent_id,
        "created_at": created_at ?? DateTime.now().toString(),
        "updated_at": updated_at
      };
}
