import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation/features/auth/presentation/view/view%20model/auth_cubit.dart';
import 'package:reservation/features/auth/presentation/view/view%20model/auth_state.dart';
class CustomeTextformfieldPass extends StatelessWidget {
  CustomeTextformfieldPass({super.key,this.hintText,this.controller,this.rightIcon,});

  String? hintText;
  TextEditingController? controller;
  Icon? rightIcon;
  @override
  Widget build(BuildContext context) {
    final screenSize=MediaQuery.of(context).size;
    return BlocProvider(
  create: (context) => AuthCubit(),
  child: BlocConsumer<AuthCubit, AuthState>(
  listener: (context, state) {},
  builder: (context, state) {
    return TextFormField(
      controller: controller,
      obscureText: context.read<AuthCubit>().statee,
      validator: (value) {
        if(value!.isEmpty){
          return "الحقل فارغ";
        }
        else if(value.length<5){
          return "كلمة المرور ضعيفه";
        }
      },
      textDirection:TextDirection.rtl,
      decoration: InputDecoration(
        suffixIcon: rightIcon,
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide(color: Color(0xffF0F5F3),width: 2)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide(color: Color(0xffF0F5F3),width: 2)),
        hintText: "$hintText",
        hintStyle: TextStyle(fontSize: screenSize.width*0.03,fontWeight: FontWeight.w600,color: Colors.grey),
        hintTextDirection: TextDirection.rtl,
        filled: true,
        fillColor: Color(0xffF0F5F3),
        prefixIcon: IconButton(onPressed: (){
          context.read<AuthCubit>().changeState();
        }, icon: Icon(Icons.visibility))
      ),
    );
  },
),
);
  }
}
