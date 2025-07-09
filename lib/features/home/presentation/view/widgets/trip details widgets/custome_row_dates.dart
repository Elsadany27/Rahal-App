import 'package:flutter/material.dart';
import '../../../../../../core/utils/app_color.dart';
import '../../../../../../core/utils/app_image.dart';

class CustomeRowDates extends StatelessWidget {
  final String? from,to,startTime,arriveTime,duration;
  const CustomeRowDates ({super.key,this.duration,this.to,this.from,this.arriveTime,this.startTime});

  @override
  Widget build(BuildContext context) {
    final screenSize=MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //first column
        Expanded(
          child: Column(children: [
            Text("$from",style: TextStyle(color: Colors.black,fontSize: screenSize.width*0.04,fontWeight: FontWeight.w800),textDirection: TextDirection.rtl,),SizedBox(height: screenSize.height*0.05,),
            Text("$to",style: TextStyle(color: Colors.black,fontSize: screenSize.width*0.04,fontWeight: FontWeight.w800),textDirection: TextDirection.rtl,),
          ],),
        ),

        //secound column
        Column(children: [
          Text("$startTime",style: TextStyle(color: Colors.black,fontSize: screenSize.width*0.035,fontWeight: FontWeight.w800),textDirection: TextDirection.rtl,),SizedBox(height: screenSize.height*0.01,),
          Text("$duration",style: TextStyle(color: AppColor.green,fontSize: screenSize.width*0.042,fontWeight: FontWeight.w800),textDirection: TextDirection.rtl,),SizedBox(height: screenSize.height*0.01,),
          Text("$arriveTime",style: TextStyle(color: Colors.black,fontSize: screenSize.width*0.035,fontWeight: FontWeight.w800),textDirection: TextDirection.rtl,),
        ],),

        // arrow
        Image.asset(Assets.arrowImage,height: screenSize.height*0.1,)
      ],);
  }
}
