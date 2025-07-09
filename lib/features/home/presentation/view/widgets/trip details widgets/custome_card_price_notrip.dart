import 'package:flutter/material.dart';

class CustomeCardPriceNotrip extends StatelessWidget {
  final String? price,noTrip;
  const CustomeCardPriceNotrip({super.key,this.price,this.noTrip});

  @override
  Widget build(BuildContext context) {
    final screenSize=MediaQuery.of(context).size;
    return Card(
      margin: EdgeInsets.symmetric(vertical: screenSize.height*0.03),
      color:Colors.white,
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.black26)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: screenSize.height*0.01),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //number of trip
            Column(children: [
              Text("رقم الرحله",style: TextStyle(color: Colors.black26,fontSize: screenSize.width*0.04,fontWeight: FontWeight.w800),textDirection: TextDirection.rtl,),
              Text("$noTrip",style: TextStyle(color: Colors.black,fontSize: screenSize.width*0.04,fontWeight: FontWeight.w800),textDirection: TextDirection.rtl,),
            ],),
            //price
            Column(children: [
              Text("السعر",style: TextStyle(color: Colors.black26,fontSize: screenSize.width*0.04,fontWeight: FontWeight.w800),textDirection: TextDirection.rtl,),
              Text("$price جنيه ",style: TextStyle(color: Colors.black,fontSize: screenSize.width*0.04,fontWeight: FontWeight.w800),textDirection: TextDirection.rtl,),
            ],)
          ],),
      ),
    );
  }
}
