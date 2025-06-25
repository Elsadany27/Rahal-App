import 'package:flutter/material.dart';
import 'package:reservation/core/routes/app_routes.dart';
import 'package:reservation/core/utils/app_color.dart';
import 'package:reservation/core/utils/app_image.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  
  @override
  void initState() {
    initAnimation();
    navigator();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.balckk,
      body: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) =>Transform.scale(child: Center(child: Image.asset(Assets.logo)),scale: _animationController.value,)),
    );
  }

  //methid
  initAnimation(){
    _animationController=AnimationController(vsync: this,duration: Duration(seconds:3),lowerBound: 0.1,upperBound: 0.9);
    _animationController.forward();
  }
  navigator(){
    Future.delayed(Duration(seconds: 5),() {
      Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.onboardingScreen, (route) => false,);
    },);
  }
}
