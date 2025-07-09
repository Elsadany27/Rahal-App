import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_color.dart';
import '../../../../../../core/utils/app_image.dart';

class CustomeTripDegree extends StatelessWidget {
  const CustomeTripDegree ({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize=MediaQuery.of(context).size;
    return Card(
        child: ListTile(
          tileColor: Colors.white,
          title: Text("Bussiness Class DD",style: TextStyle(color: Colors.black,fontSize: screenSize.width*0.035,fontWeight: FontWeight.w700),textDirection: TextDirection.rtl,),
          trailing: Image.asset(Assets.busImage,height: screenSize.height*0.035,color: AppColor.green,),
          leading: IconButton(onPressed: (){Navigator.of(context).pop();}, icon: Icon(Icons.arrow_back_ios_rounded,color: AppColor.blackLight,)),
        )
    );
  }
}
