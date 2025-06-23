import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'features/splash/presentation/view/splash_screen.dart';

main(){
  runApp(RahalApp());
}

class RahalApp extends StatelessWidget {
  const RahalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
