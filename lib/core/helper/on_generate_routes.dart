import 'package:flutter/material.dart';
import 'package:fruits_hub/features/splash/presintation/views/splash_screen.dart';

class Routes {
  static const String splash = '/splashScreen';
  static const String home = '/';
}

class OnGeneraRouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
