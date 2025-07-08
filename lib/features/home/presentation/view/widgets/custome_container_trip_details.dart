import 'package:flutter/material.dart';

import '../../../../../core/utils/app_color.dart';

class CustomeContainerTripDetails extends StatelessWidget {
   CustomeContainerTripDetails({super.key,this.from,this.to});

   String? from,to;
  @override
  Widget build(BuildContext context) {
    final screenSize=MediaQuery.of(context).size;
    return Container(
      height: screenSize.height*0.06,
      margin: EdgeInsets.symmetric(horizontal: screenSize.width*0.2,vertical: screenSize.height*0.015),
      decoration: BoxDecoration(color: AppColor.greenLight,borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("$to",style: TextStyle(color: AppColor.green,fontSize: screenSize.width*0.035,fontWeight: FontWeight.w700),),
          Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color:AppColor.green),width: screenSize.width*0.09,height: screenSize.height*0.042,child: Icon(Icons.arrow_back_ios_rounded,color: Colors.white54,size: screenSize.width*0.045,),),
          Text("$from",style: TextStyle(color: AppColor.green,fontSize: screenSize.width*0.035,fontWeight: FontWeight.w700),),
        ],),
    );
  }
}
