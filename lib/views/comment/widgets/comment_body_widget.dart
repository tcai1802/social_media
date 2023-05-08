import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/models/models.dart';
import 'package:social_media/providers/providers.dart';
import 'package:social_media/views/comment/components/components.dart';

class CommentBodyWidget extends StatelessWidget {
  const CommentBodyWidget({super.key, required this.postId});
  final String postId;
  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> snapshots = FirebaseFirestore.instance
        .collection("comments")
        .where('target_id', isEqualTo: postId)
        .snapshots();
    return Consumer<CommentProvider>(
      builder: (context, myType, child) {
        return StreamBuilder(
          stream: snapshots,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Something went wrong'));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: Text("Loading"));
            }

            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return CommentItem(
                  data: CommentModel.fromJson(snapshot.data!.docs[index].data()
                      as Map<String, dynamic>),
                );
              },
            );
          },
        );
      },
    );
  }
}
