import 'package:flutter/material.dart';
import 'package:reservation/core/utils/app_color.dart';
import 'package:reservation/features/onboarding/presentation/view/widgets/custome_pageview.dart';
import '../../../../core/routes/app_routes.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage ({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.yellow,
      body: Padding(
        padding:  EdgeInsets.symmetric(vertical: screenSize.height*0.06),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          //skip text
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:15),
            child: InkWell(onTap: (){
              Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.registerScreen, (route) => false,);
            },child: Text("تخطي",style: TextStyle(fontWeight: FontWeight.bold,fontSize: screenSize.width*0.035),)),
          ),

            //page view
            CustomePageview()
        ],),
      ),
    );
  }
}
