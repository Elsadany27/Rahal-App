import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reservation/core/routes/app_routing.dart';

import 'core/routes/app_routes.dart';
import 'features/splash/presentation/view/splash_screen.dart';

main(){
  runApp(RahalApp(appRouting: AppRouting(),));
}

class RahalApp extends StatelessWidget {
  const RahalApp({super.key,required this.appRouting});
  final AppRouting appRouting;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.notoKufiArabic().fontFamily
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouting.onGenerateRouting,
      initialRoute: AppRoutes.splashScreen,
    );
  }
}
