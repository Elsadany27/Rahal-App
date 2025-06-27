import 'dart:ffi';

import 'package:flutter/material.dart';

class CustomeTextformfield extends StatelessWidget {
   CustomeTextformfield({super.key,this.hintText,this.controller,this.secure,this.rightIcon,});

   String? hintText;
   TextEditingController? controller;
   bool? secure;
   Icon? rightIcon;
  @override
  Widget build(BuildContext context) {
    final screenSize=MediaQuery.of(context).size;
    return TextFormField(
      controller: controller,
      obscureText: secure!,
      validator: (value) {
        if(value!.isEmpty){
          return "الحقل فارغ";
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
      ),
    );
  }
}
