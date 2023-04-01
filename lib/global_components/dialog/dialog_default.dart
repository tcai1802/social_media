import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

showDialogDefault(BuildContext context, Widget widget) {
  showModalBottomSheet<void>(
    backgroundColor: Colors.transparent,
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return FractionallySizedBox(
        heightFactor: 0.5,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
              )),
          child: widget,
        ),
      );
    },
  );
}
