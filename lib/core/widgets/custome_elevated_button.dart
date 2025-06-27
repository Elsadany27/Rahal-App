import 'package:flutter/material.dart';


class CustomeElevatedButton extends StatelessWidget {
   CustomeElevatedButton ({super.key,required this.ontap ,this.textColor,this.backgroundColor,this.texxt});

   String? texxt;
   Color? backgroundColor,textColor;
   final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    final screenSize=MediaQuery.of(context).size;
    return ElevatedButton(onPressed: ontap, child: Text("$texxt",style: TextStyle(color: textColor,fontWeight: FontWeight.w600),),
      style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          // shadowColor: Colors.black12,
          // elevation: 25,
          padding: EdgeInsets.symmetric(vertical: screenSize.height*0.023),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
      ),);
  }
}
