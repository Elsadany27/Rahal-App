import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation/features/auth/presentation/view/login_screen.dart';
import 'package:reservation/features/auth/presentation/view/register_screen.dart';
import 'package:reservation/features/auth/presentation/view/view%20model/auth_cubit.dart';
import 'package:reservation/features/home/presentation/view%20model/home_cubit.dart';
import 'package:reservation/features/home/presentation/view/home_screen.dart';

import '../../features/home/presentation/view/trips_page.dart';
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
          builder: (_) =>
              BlocProvider(
                create: (context) => AuthCubit(),
                child: RegisterScreen(),
              ),
        );

      case AppRoutes.loginScreen:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                create: (context) => AuthCubit(),
                child: LoginScreen(),
              ),
        );

      case AppRoutes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );


      case AppRoutes.tripsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
                create: (context) => HomeCubit(),
                child: TripsPage(),
              ),
        );


      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(),
        );
    }
  }
}