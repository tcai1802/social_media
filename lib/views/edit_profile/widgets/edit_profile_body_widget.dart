import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:social_media/constants/index.dart';
import 'package:social_media/global_components/index.dart';
import 'package:social_media/providers/providers.dart';
import 'package:social_media/views/edit_profile/components/components.dart';

class EditProfileBodyWidget extends StatelessWidget {
  const EditProfileBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final edProfileProvider =
        Provider.of<EditProfileProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          UserAvatarDefault(
            size: 100.h,
          ),
          SizedBox(height: 20.h),
          Column(
            children: [
              TextFieldUserItem(
                title: AppStrings.fullName,
                onChange: (value) {
                  {
                    edProfileProvider.fullNameController.text = value;
                    print("Value $value");
                  }
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
