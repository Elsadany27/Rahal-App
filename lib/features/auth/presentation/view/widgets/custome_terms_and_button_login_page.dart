import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/services/sharred_prefrence.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/widgets/custome_elevated_button.dart';
import '../../../../../core/widgets/custome_loading_indicator.dart';
import '../view model/auth_cubit.dart';
import '../view model/auth_state.dart';
import 'custome_checkbox.dart';

class CustomeTermsAndButtonLoginPage extends StatefulWidget {
   CustomeTermsAndButtonLoginPage({super.key,this.email,this.password,this.keyLogin});

  TextEditingController? email;
  TextEditingController? password;
  GlobalKey<FormState>? keyLogin;
  @override
  State<CustomeTermsAndButtonLoginPage> createState() => _CustomeTermsAndButtonLoginPageState();
}

class _CustomeTermsAndButtonLoginPageState extends State<CustomeTermsAndButtonLoginPage> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final screenSize=MediaQuery.of(context).size;
    return Column(
      children: [
        TermsCheckbox(
          value: isChecked,
          onChanged: (newValue) {
            setState(() {
              isChecked = newValue ?? false; // handle null
            });
          },
        ),
        SizedBox(height: screenSize.height*0.08,),
        SizedBox(
            width: MediaQuery.of(context).size.width,
            child: BlocBuilder<AuthCubit,AuthState>(builder: (context, state) {
              if(state is IsloadingLoginState){
                return Center(child: CustomeLoadingIndicator());
              }
              else if(state is FailureLoginState){
                return Center(child: Text("${state.errorMessage}"));
              }
              else{
                return CustomeElevatedButton(ontap: ()async{
                  final savedName = await SharedPrefsService.getName();
                  print("Saved name: $savedName");
                  if(isChecked==true){
                    if(widget.keyLogin!.currentState!.validate()){
                      context.read<AuthCubit>().loginMethodCubit(email: widget.email!.text.trim(),password: widget.password!.text.trim(),context: context);
                    }
                  }
                  else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("يجب ان توافق على الشروط والاحكام")));
                  }
                },texxt: "تسجيل",backgroundColor: AppColor.green,textColor: Colors.white,);
              }
            },),),
        SizedBox(height: screenSize.height * 0.03),
        SizedBox(height: screenSize.height * 0.05),
      ],
    );
  }
}