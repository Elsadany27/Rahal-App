import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/widgets/custome_loading_indicator.dart';
import '../../../view model/home_cubit.dart';
import '../../../view model/home_state.dart';
import 'custome_card_price_notrip.dart';
import 'custome_row_dates.dart';

class CustomeDetailsTrip extends StatelessWidget {
  const CustomeDetailsTrip({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit,HomeState>(builder:(context, state) {
      final screenSize=MediaQuery.of(context).size;
      if(state is IsloadingGetSingleTrip){
        return Center(child: CustomeLoadingIndicator());
      }
      else if(state is SuccessGetSingleTrip){
        return SizedBox(
          height: screenSize.height*0.29,
          child: ListView.builder(
            itemCount:1,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //date
                  Text("${state.dataSingleTrips!.date}",style: TextStyle(color: Colors.black,fontSize: screenSize.width*0.04,fontWeight: FontWeight.w800),textDirection: TextDirection.rtl,),
                  SizedBox(height: screenSize.height*0.03,),
                  //dates
                  CustomeRowDates(to: "${state.dataSingleTrips!.toArea}",from: "${state.dataSingleTrips!.fromArea}",duration: "${state.dataSingleTrips!.duration}",arriveTime: "${state.dataSingleTrips!.timeOfReach}",startTime: "${state.dataSingleTrips!.timeOfTravel}",),
                  //price & number trip
                  CustomeCardPriceNotrip(price: "${state.dataSingleTrips!.price}",noTrip: "${state.dataSingleTrips!.tripNumber}",)
                ],
              ),
            ),),
        );
      }
      else if(state is FailureGetSingleTrips){
        return Center(child: Text("خطا فى تحميل البيانات"));
      }
      else {
        return Center(child: Text("لا يوجد تفاصيل لهذه الرحله"));
      }
    },);
  }
}
