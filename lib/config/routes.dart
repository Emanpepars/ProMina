import 'package:flutter/material.dart';
import '../features/login/presentation/pages/login_screen.dart';
import '../features/my_gallery/presentation/pages/my_gallery.dart';

class Routes {
  static const String login = 'login';
  static const String home = 'home';
}

class AppRoutes {
  static Route onGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (context) => const MyGallery());

      default:
        return MaterialPageRoute(builder: (context) => const Scaffold());
    }
  }
}
