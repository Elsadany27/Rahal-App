import 'package:flutter/material.dart';

import '../../../../../core/utils/app_color.dart';

class ReservationTripDetails extends StatelessWidget {
   ReservationTripDetails ({super.key,this.price});

   String? price;
  @override
  Widget build(BuildContext context) {
    final screenSize=MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: screenSize.width*0.15,),
          Text("السعر:$price جنيه",style: TextStyle(color: AppColor.green,fontSize: screenSize.width*0.04,fontWeight: FontWeight.w800),),
          MaterialButton(
            shape: OutlineInputBorder(borderRadius: BorderRadius.circular(7),borderSide: BorderSide(color: AppColor.greenLight)),
            onPressed: (){},height: screenSize.height*0.04,color: AppColor.greenLight,textColor: AppColor.green,child: Text("حجز",style: TextStyle(fontWeight: FontWeight.w700,fontSize: screenSize.width*0.04),),)
        ],),
    );
  }
}
