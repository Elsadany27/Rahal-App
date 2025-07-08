import 'package:flutter/material.dart';

import '../utils/app_color.dart';

class CustomeAppbar extends StatelessWidget {
   CustomeAppbar({super.key,this.texxt});

  String? texxt;
  @override
  Widget build(BuildContext context) {
    final screenSize=MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: screenSize.width*0.08,),
        Text("$texxt",style: TextStyle(fontSize:screenSize.width*0.045,fontWeight: FontWeight.w700 ),),
        CircleAvatar(radius: 22,child: IconButton(onPressed: (){Navigator.of(context).pop();}, icon: Icon(Icons.arrow_forward_outlined,color: AppColor.blackLight,)),backgroundColor:Color(0xffFAFCF0) ,)
      ],);
  }
}
