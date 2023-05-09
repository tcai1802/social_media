import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:social_media/constants/colors.dart';
import 'package:social_media/constants/index.dart';
import 'package:social_media/global_components/index.dart';
import 'package:social_media/models/comment/comment_model.dart';
import 'package:social_media/providers/providers.dart';

class AddCommentWidget extends StatelessWidget {
  const AddCommentWidget({
    super.key,
    required this.postId,
  });
  final String postId;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CommentProvider>(context, listen: false);
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    TextEditingController contentController = TextEditingController();
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 10.w),
          child: Row(
            children: [
              UserAvatarDefault(
                size: 50.h,
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: TextField(
                  controller: contentController,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.mineShaftColor,
                  ),
                  decoration: InputDecoration(
                    hintText: AppStrings.addCommentHint,
                    isDense: true,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    hintStyle: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.dustyGrayColor,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  provider.handleAddComment(
                      targetId: postId,
                      inputData: CommentModel(
                        content: contentController.text.trim(),
                        user_id: loginProvider.currentUser?.userId ?? "",
                        target_id: postId,
                      ).toJson());
                },
                child: const Icon(Icons.send),
              )
            ],
          ),
        ));
  }
}
