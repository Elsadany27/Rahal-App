import 'package:flutter/material.dart';

import '../../../../../core/utils/app_color.dart';

class DegreeOfTrip extends StatelessWidget {
  const DegreeOfTrip({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize=MediaQuery.of(context).size;
    return Container(
      height: screenSize.height*0.065,
      width: double.infinity,
      color: AppColor.yellow,
      child: ListTile(
        visualDensity: VisualDensity(vertical: -4),
        title: Text("Bussiness Class DD",style: TextStyle(color: Colors.black38,fontSize: screenSize.width*0.035,fontWeight: FontWeight.w600),textDirection: TextDirection.rtl,),
        subtitle: Text("درجه أولى",style: TextStyle(color: Colors.black38,fontSize: screenSize.width*0.035,fontWeight: FontWeight.w600),textDirection: TextDirection.rtl,),
        leading: InkWell(
          onTap: (){},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.arrow_back_ios_rounded,color: AppColor.green,size: screenSize.width*0.05,),
              SizedBox(width: screenSize.width*0.01,),
              Text("تفاصيل",style: TextStyle(color: AppColor.green,fontSize: screenSize.width*0.035,fontWeight: FontWeight.w600),textDirection: TextDirection.rtl,),
            ],),
        ),
      ),
    );
  }
}
