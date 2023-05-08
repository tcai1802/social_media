import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:social_media/providers/providers.dart';

class AddPostFormBody extends StatefulWidget {
  const AddPostFormBody({super.key});

  @override
  State<AddPostFormBody> createState() => _AddPostFormBodyState();
}

class _AddPostFormBodyState extends State<AddPostFormBody> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    final provider = Provider.of<AddPostProvider>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 14.h),
          child: Row(
            children: [
              Container(
                height: 40.h,
                width: 40.h,
                margin: EdgeInsets.only(right: 20.h),
                child: FutureBuilder(
                    future: context
                        .watch<AddPostProvider>()
                        .currentMediaList[0]
                        .file,
                    builder: (context, snapshot) {
                      if (snapshot.hasData &&
                          snapshot.connectionState == ConnectionState.done) {
                        return Image.file(
                          snapshot.data!,
                          fit: BoxFit.cover,
                        );
                      }
                      return Container();
                    }),
              ),
              Expanded(
                child: TextField(
                  controller: controller,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xFF262626),
                  ),
                  onChanged: (value) {
                    provider.caption = value;
                  },
                  decoration: InputDecoration(
                    hintText: "Enter your caption...",
                    isDense: true,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    hintStyle: TextStyle(
                      fontSize: 14.sp,
                      color: const Color(0xFF979797),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              )
            ],
          ),
        ),
        //const Divider(color: Color(0xFF979797), height: 4),
        //Padding(
        //  padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 14.h),
        //  child: Text(
        //    "Gắn thẻ người khác",
        //    textAlign: TextAlign.start,
        //    style: TextStyle(
        //      fontWeight: FontWeight.w400,
        //      fontSize: 14.sp,
        //    ),
        //  ),
        //),
        //const Divider(color: Color(0xFF979797), height: 4),
        //Padding(
        //  padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 14.h),
        //  child: Text(
        //    "Thêm vị trí",
        //    textAlign: TextAlign.start,
        //    style: TextStyle(
        //      fontWeight: FontWeight.w400,
        //      fontSize: 14.sp,
        //    ),
        //  ),
        //),
      ],
    );
  }
}
