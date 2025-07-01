import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart'; // ✅ correct import
import 'package:reservation/core/routes/app_routing.dart';

import 'core/routes/app_routes.dart';

main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ar'); // 🔥 required for Arabic
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
