import 'package:flutter/material.dart';
import 'package:social_media/routes/routes.dart';
import 'package:social_media/views/index.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case (Routes.splashRoute):
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case (Routes.loginRoute):
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case (Routes.signUpRoute):
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case (Routes.mainRoute):
        return MaterialPageRoute(builder: (_) => MainScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
