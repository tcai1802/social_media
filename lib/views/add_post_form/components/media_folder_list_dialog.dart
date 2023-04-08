import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:provider/provider.dart';
import 'package:social_media/global_components/index.dart';
import 'package:social_media/providers/add_post/add_post_provider.dart';

showMediaFolderListDialog(BuildContext context) {
  AddPostProvider addPostProvider =
      Provider.of<AddPostProvider>(context, listen: false);
  return showDialogDefault(
    context,
    ListView.builder(
      itemCount: addPostProvider.pathList.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            addPostProvider.handleSelectMediaFolder(index);
            Navigator.of(context).pop();
          },
          child: Padding(
            padding: EdgeInsets.only(top: 20.h, left: 20.h),
            child: Text(
              addPostProvider.pathList[index].name,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        );
      },
    ),
  );
}
