import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutteradvace/core/di/dependency_injection.dart';
import 'package:flutteradvace/core/routing/routes.dart';
import 'package:flutteradvace/features/home/ui/home_screen.dart';
import 'package:flutteradvace/features/login/logic/login_cubit.dart';
import 'package:flutteradvace/features/login/ui/login_screen.dart';
import 'package:flutteradvace/features/onboarding/onboarding_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text("No Route define d for ${routeSettings.name}"),
            ),
          ),
        );
    }
  }
}
