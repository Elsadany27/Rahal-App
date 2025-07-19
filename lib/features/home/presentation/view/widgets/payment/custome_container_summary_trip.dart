import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation/core/widgets/custome_loading_indicator.dart';
import 'package:reservation/features/home/presentation/view%20model/home_cubit.dart';
import 'package:reservation/features/home/presentation/view%20model/home_state.dart';

import '../../../../../../core/utils/app_color.dart';

class CustomeContainerSummaryTrip extends StatelessWidget {
  final int? idTrip;
  final List<int>? seatsTrip;
  const CustomeContainerSummaryTrip({super.key,this.idTrip,this.seatsTrip});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return BlocProvider(
  create: (context) => HomeCubit()..getSingleTripCubit(context: context,id:idTrip ),
  child: BlocBuilder<HomeCubit,HomeState>(builder: (context, state) {
      if(state is IsloadingGetSingleTrip){
        return Expanded(child: Center(child: CustomeLoadingIndicator()));
      }
      else if(state is FailureGetSingleTrips){
        return Center(child: Text("فشل فى تحميل البيانات"));
      }
      else if(state is SuccessGetSingleTrip){
        return Container(
          margin: EdgeInsets.symmetric(vertical: screenSize.height*0.02,horizontal: screenSize.width*0.02),
          padding: EdgeInsets.symmetric(vertical: screenSize.height*0.01,horizontal: screenSize.width*0.02),
          height: screenSize.height*0.2,
          decoration: BoxDecoration(
            color: AppColor.yellow,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("ملخص الحجز",style: TextStyle(color: AppColor.green,fontSize: screenSize.width*0.04,fontWeight: FontWeight.w700),textAlign: TextAlign.end,),
              SizedBox(height: screenSize.height*0.02),
              //number if trip and date
              Row(children: [
                Expanded(
                  child: Column(children: [
                    Text("التاريخ والوقت",style: TextStyle(color: Colors.black38,fontSize: screenSize.width*0.032,fontWeight: FontWeight.w700),textAlign: TextAlign.end,),
                    Text("${state.dataSingleTrips!.date} : ${state.dataSingleTrips!.timeOfTravel}",style: TextStyle(color: AppColor.blackLight,fontSize: screenSize.width*0.03,fontWeight: FontWeight.w700),textAlign: TextAlign.end,),
                  ],),
                ),

                Expanded(
                  child: Column(children: [
                    Text("رقم الرحله",style: TextStyle(color: Colors.black38,fontSize: screenSize.width*0.032,fontWeight: FontWeight.w700),textAlign: TextAlign.end,),
                    Text("${state.dataSingleTrips!.tripNumber}",style: TextStyle(color: AppColor.blackLight,fontSize: screenSize.width*0.03,fontWeight: FontWeight.w700),textAlign: TextAlign.end,),
                  ],),
                ),
              ],) ,

              //price --- seats
              SizedBox(height: screenSize.height*0.025),
              Row(children: [
                Expanded(
                  child: Column(children: [
                    Text("السعر",style: TextStyle(color: Colors.black38,fontSize: screenSize.width*0.032,fontWeight: FontWeight.w700),textAlign: TextAlign.end,),
                    Text(" جنيه ${state.dataSingleTrips!.price}",style: TextStyle(color: AppColor.blackLight,fontSize: screenSize.width*0.03,fontWeight: FontWeight.w700),textAlign: TextAlign.end,),
                  ],),
                ),

                Expanded(
                  child: Column(children: [
                    Text("رقم المقعد",style: TextStyle(color: Colors.black38,fontSize: screenSize.width*0.032,fontWeight: FontWeight.w700),textAlign: TextAlign.end,),
                    Text("${seatsTrip}",style: TextStyle(color: AppColor.blackLight,fontSize: screenSize.width*0.03,fontWeight: FontWeight.w700),textAlign: TextAlign.end,),
                  ],),
                ),
              ],)
            ],),
        );
      }
      else {
        return Center(child: Text("لا يوجد بيانات لعرضها"));
      }
    },),
);
  }
}
