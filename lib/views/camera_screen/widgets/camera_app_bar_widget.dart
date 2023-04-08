import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:social_media/providers/camera/camera_provider.dart';

class CameraAppBarWidget extends StatelessWidget {
  const CameraAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    CameraProvider cameraProvider =
        Provider.of<CameraProvider>(context, listen: false);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              const Spacer(),
              InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 40.h,
                ),
              )
            ],
          ),
          const Spacer(),
          InkWell(
            onTap: () => cameraProvider.handleChangeCamera(),
            child: Icon(
              Icons.swap_horiz_rounded,
              color: Colors.grey[350],
              size: 40.h,
            ),
          ),
          SizedBox(height: 80.h),
        ],
      ),
    );
  }
}
