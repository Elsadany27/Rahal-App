import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation/core/routes/app_routes.dart';
import 'package:reservation/core/utils/app_color.dart';
import 'package:reservation/core/utils/app_image.dart';
import 'package:reservation/features/auth/presentation/view/view%20model/auth_cubit.dart';
import 'package:reservation/features/auth/presentation/view/view%20model/auth_state.dart';
import 'package:reservation/features/auth/presentation/view/widgets/custome_textformfield.dart';
import 'package:reservation/features/auth/presentation/view/widgets/custome_textformfield_pass.dart';

import '../../../../core/widgets/custome_elevated_button.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key});

  TextEditingController name=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();

  GlobalKey<FormState> keyRegister=GlobalKey();
  @override
  Widget build(BuildContext context) {
    final screenSize=MediaQuery.of(context).size;
    return BlocProvider(
  create: (context) => AuthCubit(),
  child: Scaffold(
      backgroundColor: Color(0xffFFFFFD),
      body: Padding(
        padding:  EdgeInsets.only(top: screenSize.height*0.05,left: screenSize.width*0.03,right: screenSize.width*0.03),
        child: Form(
          key: keyRegister,
          child: ListView(
                  children: [
                  //image
                    Image.asset(Assets.busImage,height: screenSize.height*0.15,scale: 0.5,color: AppColor.green,),
                  //form
                    SizedBox(height: screenSize.height*0.05,),
                    Text("الاسم",style: TextStyle(fontWeight: FontWeight.w700,color: AppColor.green,fontSize: screenSize.width*0.04),textDirection: TextDirection.rtl,),SizedBox(height: screenSize.height*0.01,),
                    CustomeTextformfield(hintText: "مثال راندا حمدى",secure: false,controller:name,rightIcon: Icon(Icons.person_2_outlined),),

                    SizedBox(height: screenSize.height*0.02,),
                    Text("الايميل",style: TextStyle(fontWeight: FontWeight.w700,color: AppColor.green,fontSize: screenSize.width*0.04),textDirection: TextDirection.rtl,),SizedBox(height: screenSize.height*0.01,),
                    CustomeTextformfield(hintText: "randahamdy@gmail.com",secure: false,controller:email,rightIcon: Icon(Icons.email_outlined),),

                    SizedBox(height: screenSize.height*0.02,),
                    Text("كلمة المرور",style: TextStyle(fontWeight: FontWeight.w700,color: AppColor.green,fontSize: screenSize.width*0.04),textDirection: TextDirection.rtl,),SizedBox(height: screenSize.height*0.01,),
                    CustomeTextformfieldPass(hintText: "*********",controller:password,rightIcon: Icon(Icons.lock_outline),),

                    //button
                    SizedBox(height: screenSize.height*0.08,),


          BlocBuilder<AuthCubit,AuthState>(builder: (context, state) {
                            if(state is IsloadingRegisterState){
                              return CircularProgressIndicator();
                            }
                            else if(state is FailureRegisterState){
                              return Center(child: Text("${state.errorMessage}"));
                            }
                            else{
                              return CustomeElevatedButton(ontap: (){
                                if(keyRegister.currentState!.validate()){
                                  context.read<AuthCubit>().signupMethodCubit(email: email.text.trim(),password: password.text.trim(),context: context);
                                }
                              },texxt: "تسجيل",backgroundColor: AppColor.green,textColor: Colors.white,);
                            }
                          },),
                    SizedBox(height: screenSize.height*0.03,),
                    CustomeElevatedButton(ontap: (){
                      Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.loginScreen, (route) => false,);
                    },texxt: "تسجيل دخول",backgroundColor: Colors.white,textColor: AppColor.green,)
                  ],),
        ),
      ),
    ),
);
  }
}
