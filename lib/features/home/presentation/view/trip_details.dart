import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation/core/utils/app_color.dart';
import 'package:reservation/core/widgets/custome_appbar.dart';
import 'package:reservation/core/widgets/custome_loading_indicator.dart';
import 'package:reservation/features/home/presentation/view%20model/home_cubit.dart';
import 'package:reservation/features/home/presentation/view%20model/home_state.dart';
import 'package:reservation/features/home/presentation/view/widgets/trip%20details%20widgets/custome_card_price_notrip.dart';
import 'package:reservation/features/home/presentation/view/widgets/trip%20details%20widgets/custome_details_trip.dart';
import 'package:reservation/features/home/presentation/view/widgets/trip%20details%20widgets/custome_row_dates.dart';
import 'package:reservation/features/home/presentation/view/widgets/trip%20details%20widgets/custome_trip_degree.dart';

class TripDetails extends StatelessWidget {
  final int? id;

  const TripDetails({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    final screenSize=MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => HomeCubit()..getSingleTripCubit(context: context,id: id),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(children: [
            //appbar
            CustomeAppbar(texxt: "تفاصيل الرحله",),
            //degree
            CustomeTripDegree(),
            //trip details
            CustomeDetailsTrip(),
            //services
            Text("الخدمات",style: TextStyle(color: AppColor.green,fontSize: screenSize.width*0.04,fontWeight: FontWeight.w800),textDirection: TextDirection.rtl,),
          ],),
        ),
      ),
    );
  }
}
