import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reservation/core/utils/app_color.dart';
import 'package:reservation/core/utils/app_image.dart';
import 'package:reservation/features/home/presentation/view/widgets/custome_home_appbar.dart';
import 'package:reservation/features/home/presentation/view/widgets/time_date.dart';


class HomeScreen extends StatelessWidget {
   const HomeScreen ({super.key});

   @override
  Widget build(BuildContext context) {
    final screenSize=MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(children: [
        //appbar
        CustomeHomeAppbar(),
        //image with text
        Row(children: [
          //image
          Expanded(child: Image.asset(Assets.homeUmage,)),
          Expanded(child: Text("اكتشف سهولة السفر معنا\n اختر وجهتك الاَن!",style: TextStyle(fontWeight: FontWeight.w800,fontSize: screenSize.width*0.04,color: AppColor.green),textAlign: TextAlign.end,overflow: TextOverflow.clip,))
        ],),

        //dates
        TimeDate(
          onDateSelected: (selectedDate) {
            print("Parent received: ${DateFormat.yMMMMd('ar').format(selectedDate)}");
          },
        ),


        // Container(
        //     height: 750,
        //     child: TimeDate())

      ],),
    );
  }
}
