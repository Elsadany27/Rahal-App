// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:reservation/core/widgets/custome_loading_indicator.dart';
// import 'package:reservation/features/home/presentation/view%20model/home_cubit.dart';
// import 'package:reservation/features/home/presentation/view%20model/home_state.dart';
//
// class TripsPage extends StatelessWidget {
//   const TripsPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocProvider(
//         create: (context) => HomeCubit()..getTripsCubit(context: context),
//         child: BlocBuilder<HomeCubit,HomeState>(builder: (context, state) {
//           if(state is IsloadingGetTrips){
//             return Center(child: CustomeLoadingIndicator());
//           }
//           else if(state is SuccessGetTrips){
//             return ListView.builder(
//                 itemCount: state.dataTrips.length,
//                 itemBuilder: (context, index) => ListTile(
//                   title: Text("${state.dataTrips[index].fromArea}"),
//                   subtitle: Text("${state.dataTrips[index].toArea}"),
//                 ),);
//           }
//           else if (state is FailureGetTrips){
//             return Center(child: Text("خطا غير متوقع"));
//           }
//           else{
//             return Center(child: Text("لا يوجد رحلات"));
//           }
//         },)
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:reservation/core/utils/app_color.dart';
import 'package:reservation/core/widgets/custome_elevated_button.dart';
import 'package:reservation/features/home/presentation/view/widgets/custome_container_trip_details.dart';
import 'package:reservation/features/home/presentation/view/widgets/custome_destination_details.dart';
import 'package:reservation/features/home/presentation/view/widgets/custome_ticket.dart';
import 'package:reservation/features/home/presentation/view/widgets/degree_of_trip.dart';
import 'package:reservation/features/home/presentation/view/widgets/reservation_trip_details.dart';

import '../../../../core/widgets/custome_appbar.dart';

class TripsPage extends StatelessWidget {
   TripsPage({super.key,this.dateTrip,this.destinationStation,this.fromStation});

   String? fromStation,destinationStation,dateTrip;
  @override
  Widget build(BuildContext context) {
    final screenSize=MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(children: [
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TicketWidget(fromArea: fromStation,toArea: destinationStation,allTime: "4h,55min",dateArrivee: "12:00",dateSatrtt: "5:00",),
        )
        // Container(
        //   // color: Colors.red,
        //   margin: EdgeInsets.symmetric(vertical: screenSize.height*0.03),
        //   height: screenSize.height*0.25,
        //   child: Column(children: [
        //     //degree of trip
        //     const DegreeOfTrip(),
        //     SizedBox(height: screenSize.height*0.02,),
        //     //destination details
        //     CustomeDestinationDetails(fromArea: fromStation,toArea: destinationStation,),
        //     //reservation
        //     ReservationTripDetails(price: "350",)
        //   ],),
        // )

      ],),
    );
  }
}
