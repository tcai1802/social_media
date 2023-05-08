import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:social_media/arguments/arguments.dart';
import 'package:social_media/global_components/index.dart';
import 'package:social_media/providers/providers.dart';
import 'package:social_media/views/comment/widgets/widgets.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key, required this.data});
  final CommentArgument data;
  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  @override
  void initState() {
    // TODO: implement initState
    print("Data: ${widget.data}");
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      Provider.of<CommentProvider>(context, listen: false)
          .handleShowAllComment(widget.data.postId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: Text(
            "Comments",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          )),
      body: Stack(
        children: [
          CommentBodyWidget(postId: widget.data.postId),
          AddCommentWidget(postId: widget.data.postId)
        ],
      ),
    );
  }
}
