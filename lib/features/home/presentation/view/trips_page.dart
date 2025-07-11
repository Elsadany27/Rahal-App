import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation/core/widgets/custome_loading_indicator.dart';
import 'package:reservation/features/home/presentation/view%20model/home_cubit.dart';
import 'package:reservation/features/home/presentation/view%20model/home_state.dart';
import 'package:reservation/features/home/presentation/view/widgets/custome_container_trip_details.dart';
import 'package:reservation/features/home/presentation/view/widgets/custome_ticket.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/widgets/custome_appbar.dart';

class TripsPage extends StatelessWidget {
   TripsPage({super.key,this.dateTrip,this.destinationStation,this.fromStation});

   String? fromStation,destinationStation,dateTrip;
  @override
  Widget build(BuildContext context) {
    final screenSize=MediaQuery.of(context).size;
    return Scaffold(
      body: BlocProvider(
  create: (context) => HomeCubit()..getTripsCubit(context: context),
  child: ListView(children: [
        //appbar
        CustomeAppbar(texxt: "التذاكر",),
        //details
        CustomeContainerTripDetails(from: fromStation,to: destinationStation,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$dateTrip",style: TextStyle(color: Colors.black38,fontSize: screenSize.width*0.04,fontWeight: FontWeight.w700),),
            Icon(Icons.date_range_outlined,color: Colors.black26,size: screenSize.width*0.05,)
          ],
        ),


        //tickets
    BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is IsloadingGetTrips) {
          return const Center(child: CustomeLoadingIndicator());
        } else if (state is SuccessGetTrips) {
          final filteredTrips = state.dataTrips.where((trip) {
            return trip.fromArea == fromStation && trip.toArea == destinationStation && trip.date == dateTrip;
          }).toList();
          if (filteredTrips.isEmpty) {
            return const Center(child: Text("لا توجد رحلات مطابقة."));
          }

          return SizedBox(
            height: screenSize.height * 0.8,
            child: ListView.builder(
              itemCount: filteredTrips.length,
              itemBuilder: (context, index) {
                final trip = filteredTrips[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("${filteredTrips.length}:عدد نتائج البحث ",style: TextStyle(color: Colors.black54,fontSize: screenSize.width*0.035,fontWeight: FontWeight.w700),textDirection: TextDirection.ltr,),SizedBox(height: screenSize.height*0.015,),
                      TicketWidget(price: trip.price,fromArea: trip.fromArea, toArea: trip.toArea, allTime: trip.duration, dateArrivee: trip.timeOfReach, dateSatrtt: trip.timeOfTravel,idd: trip.id,),
                    ],
                  ),
                );
              },),
          );
        } else if (state is FailureGetTrips) {
          return const Center(child: Text("خطأ غير متوقع"));
        } else {
          return const Center(child: Text("لا يوجد رحلات"));
        }
      },
    ),
      ],),
),
    );
  }
}
