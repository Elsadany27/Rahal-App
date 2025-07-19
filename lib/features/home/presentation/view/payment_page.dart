import 'package:flutter/material.dart';
import 'package:reservation/core/utils/app_color.dart';
import 'package:reservation/core/widgets/custome_appbar.dart';
import 'package:reservation/features/home/presentation/view/widgets/payment/custome_container_summary_trip.dart';

class PaymentPage extends StatelessWidget {
   PaymentPage({super.key,this.seats,this.idTrip});
   List<int>? seats;
   int? idTrip;
  @override
  Widget build(BuildContext context) {
    final screenSize=MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(children: [
        //appbar
        CustomeAppbar(texxt: "الدفع",),
        //sumaary of trip
        CustomeContainerSummaryTrip(idTrip: idTrip,seatsTrip: seats,)
      ],),
    );
  }
}
