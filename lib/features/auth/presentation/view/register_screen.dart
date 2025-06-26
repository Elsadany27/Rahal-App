import 'package:flutter/material.dart';
import 'package:reservation/core/utils/app_color.dart';
import 'package:reservation/core/utils/app_image.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize=MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
          //image
            Image.asset(Assets.busImage,height: screenSize.height*0.2,scale: 0.5,),
          //form
          Text("الاسم",style: TextStyle(fontWeight: FontWeight.w700,color: AppColor.green,fontSize: screenSize.width*0.04),textDirection: TextDirection.rtl,)
          ],),
      ),
    );
  }
}
