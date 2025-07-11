import 'package:flutter/material.dart';
import 'package:reservation/features/home/data/static%20data/static%20data.dart';

import '../../../../../../core/utils/app_color.dart';
import '../../../../../../core/utils/app_image.dart';

class CustomeServicesContainer extends StatelessWidget {
    CustomeServicesContainer({super.key});

   List<StaticData> servicesTrips=[
     StaticData(image: "${Assets.foodreservationImage}",text: "طعام"),
     StaticData(image: "${Assets.chargeImage}",text: "شحن"),
     StaticData(image: "${Assets.tvImage}",text: "شاشه"),
     StaticData(image: "${Assets.toiletImage}",text: "تويليت"),
     StaticData(image: "${Assets.airconditionImage}",text: "مكيف"),
     StaticData(image: "${Assets.drinksImage}",text: "مشروبات"),
   ];
  @override
  Widget build(BuildContext context) {
    final screenSize=MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: screenSize.height*0.03),
      height: screenSize.height*0.19,
      child: GridView.builder(
        itemCount: servicesTrips.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 3.5,mainAxisSpacing: 0.2,crossAxisSpacing: 5), itemBuilder: (context, index) => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("${servicesTrips[index].text}",style: TextStyle(color: AppColor.green,fontSize: screenSize.width*0.04,fontWeight: FontWeight.w800),textDirection: TextDirection.rtl,),SizedBox(width: screenSize.width*0.03,),
          CircleAvatar(child: Image.asset("${servicesTrips[index].image}",color: AppColor.green,),radius: 20,backgroundColor: AppColor.greenLight,)
        ],),),
    );
  }
}
