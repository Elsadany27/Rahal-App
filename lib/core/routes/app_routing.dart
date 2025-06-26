import 'package:flutter/material.dart';
import 'package:reservation/features/auth/presentation/view/register_screen.dart';

import '../../features/onboarding/presentation/view/onboarding_page.dart';
import '../../features/splash/presentation/view/splash_screen.dart';
import 'app_routes.dart';

class AppRouting {
  Route onGenerateRouting(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashScreen:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
        );

      case AppRoutes.onboardingScreen:
        return MaterialPageRoute(
          builder: (_) => OnboardingPage(),
        );

      case AppRoutes.registerScreen:
        return MaterialPageRoute(
          builder: (_) => RegisterScreen(),
        );


      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(),
        );
    }
  }
}