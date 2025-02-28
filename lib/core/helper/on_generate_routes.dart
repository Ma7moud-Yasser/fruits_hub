import 'package:flutter/material.dart';
import 'package:fruits_hub/features/auth/presintation/views/sign_in_screen.dart';
import 'package:fruits_hub/features/auth/presintation/views/sign_up_screen.dart';
import 'package:fruits_hub/features/on_boarding/presintaion/views/on_boarding_screen.dart';
import 'package:fruits_hub/features/splash/presintation/views/splash_screen.dart';

class Routes {
  static const String splash = '/splashScreen';
  static const String onBoardingScreen = '/onBoardingScreen';
  static const String signInScreen = '/signInScreen';
  static const String signUpScreen = '/signUpScreen';

  static const String home = '/';
}

class OnGeneraRouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.signInScreen:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case Routes.signUpScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
