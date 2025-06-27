import 'package:flutter/material.dart';
import 'package:reservation/core/routes/app_routes.dart';
import 'package:reservation/core/utils/app_color.dart';
import 'package:reservation/core/utils/app_image.dart';
import 'package:reservation/features/auth/presentation/view/widgets/custome_checkbox.dart';
import 'package:reservation/features/auth/presentation/view/widgets/custome_terms_and_button_login_page.dart';
import 'package:reservation/features/auth/presentation/view/widgets/custome_textformfield.dart';
import 'package:reservation/features/auth/presentation/view/widgets/custome_textformfield_pass.dart';
import '../../../../core/widgets/custome_elevated_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenSize=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffFFFFFD),
      body: Padding(
        padding:  EdgeInsets.only(top: screenSize.height*0.07,left: screenSize.width*0.03,right: screenSize.width*0.03),
        child: ListView(
          children: [
            //image
            Image.asset(Assets.busImage,height: screenSize.height*0.15,scale: 0.5,color: AppColor.green,),
            //form
            SizedBox(height: screenSize.height*0.05,),
            Text("الايميل",style: TextStyle(fontWeight: FontWeight.w700,color: AppColor.green,fontSize: screenSize.width*0.04),textDirection: TextDirection.rtl,),SizedBox(height: screenSize.height*0.01,),
            CustomeTextformfield(hintText: "randahamdy@gmail.com",secure: false,controller:email,rightIcon: Icon(Icons.email_outlined),),

            SizedBox(height: screenSize.height*0.02,),
            Text("كلمة المرور",style: TextStyle(fontWeight: FontWeight.w700,color: AppColor.green,fontSize: screenSize.width*0.04),textDirection: TextDirection.rtl,),SizedBox(height: screenSize.height*0.01,),
            CustomeTextformfieldPass(hintText: "*********",controller:password,rightIcon: Icon(Icons.lock_outline),),
            //button
            SizedBox(height: screenSize.height*0.01,),
            CustomeTermsAndButtonLoginPage(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              TextButton(onPressed: (){
                Navigator.of(context).pushNamed(AppRoutes.registerScreen);
              },child:Text("سجل الاَن",style: TextStyle(color: AppColor.green,fontWeight: FontWeight.w600),)),
              Text("جديد؟",style: TextStyle(color: AppColor.blackLight,fontWeight: FontWeight.w600),)
            ],)
          ],),
      ),
    );
  }
}
