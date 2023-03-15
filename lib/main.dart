import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:social_media/config/providers.dart';
import 'package:social_media/constants/themes.dart';
import 'package:social_media/config/app_routes.dart';
import 'package:social_media/config/routes.dart';
import 'package:social_media/views/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: providers,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Social Media App',
            theme: AppThemes.lightTheme,
            initialRoute: Routes.loginRoute,
            onGenerateRoute: AppRoutes.onGenerateRoute,
            home: child,
          ),
        );
      },
    );
  }
}
