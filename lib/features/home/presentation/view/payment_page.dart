import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
   PaymentPage({super.key,this.seats,this.idTrip});

   List<int>? seats;
   int? idTrip;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        print(seats);
        print(idTrip);
      },child: Icon(Icons.add),),
    );
  }
}
