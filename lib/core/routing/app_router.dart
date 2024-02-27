import 'package:flutter/material.dart';
import 'package:flutteradvace/core/routing/routes.dart';
import 'package:flutteradvace/features/login/ui/login_screen.dart';
import 'package:flutteradvace/features/onboarding/onboarding_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text("No Route defined for ${routeSettings.name}"),
                  ),
                ));
    }
  }
}
