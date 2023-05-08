import 'package:flutter/material.dart';
import 'package:social_media/arguments/arguments.dart';
import 'package:social_media/config/routes.dart';
import 'package:social_media/views/index.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case (Routes.splashRoute):
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case (Routes.loginRoute):
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case (Routes.signUpRoute):
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case (Routes.mainRoute):
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case (Routes.addRoute):
        return MaterialPageRoute(builder: (_) => const AddScreen());
      case (Routes.addPostFormRoute):
        return MaterialPageRoute(builder: (_) => const AddPostFormScreen());
      case (Routes.commentRoute):
        return MaterialPageRoute(
          builder: (_) =>
              CommentScreen(data: settings.arguments as CommentArgument),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
