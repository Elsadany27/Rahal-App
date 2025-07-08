import 'package:flutter/material.dart';

import '../../../../../core/utils/app_color.dart';

class CustomeDestinationDetails extends StatelessWidget {
   CustomeDestinationDetails({super.key,this.toArea,this.fromArea,this.dateArrive,this.overallTime,this.dateStart});

   String? toArea,fromArea,dateStart,dateArrive,overallTime;
  @override
  Widget build(BuildContext context) {
    final screenSize=MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        //first column
        Column(children: [
          Text("$toArea",style: TextStyle(color: AppColor.blackLight,fontSize: screenSize.width*0.03,fontWeight: FontWeight.w600),),
          Text("$dateArrive",style: TextStyle(color: AppColor.blackLight,fontSize: screenSize.width*0.03,fontWeight: FontWeight.w600),),
        ],),
        Column(children: [
          Text("$overallTime",style: TextStyle(color: AppColor.blackLight,fontSize: screenSize.width*0.03,fontWeight: FontWeight.w500),),
          Text("<------------------->",style: TextStyle(color: AppColor.blackLight,fontSize: screenSize.width*0.03,fontWeight: FontWeight.w500),),
        ],),
        //secound column
        Column(children: [
          Text("$fromArea",style: TextStyle(color: AppColor.blackLight,fontSize: screenSize.width*0.03,fontWeight: FontWeight.w600),),
          Text("$dateStart",style: TextStyle(color: AppColor.blackLight,fontSize: screenSize.width*0.03,fontWeight: FontWeight.w600),),
        ],),
      ],);
  }
}
