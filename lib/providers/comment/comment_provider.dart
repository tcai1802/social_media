import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:social_media/api/api.dart';
import 'package:social_media/models/models.dart';

class CommentProvider extends ChangeNotifier {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  List<CommentModel> commentList = [];
  Future<void> handleShowAllComment(String postId) async {
    Stream<QuerySnapshot> snapshot = firebaseFirestore
        .collection("comments")
        .where('target_id', isEqualTo: postId)
        .snapshots();

    //for (var item in snapshot.docs) {
    //  print("===${item.data()}");
    //  commentList.add(CommentModel.fromJson(item.data()));
    //}
    snapshot.asyncMap((event) => print("===="));
    notifyListeners();
  }

  Future<void> handleAddComment(
      {required String targetId,
      required Map<String, dynamic> inputData}) async {
    Response? res = await CommentApi().addCommentApi(inputData, targetId);
    if (res != null && res.data["code"] == "successfully") {
      print("Response ${res.data}");
    } else {
      print("Response ");
    }
  }
}
