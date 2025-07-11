import 'package:flutter/material.dart';
import 'package:reservation/features/home/presentation/view/widgets/reservation_trip_details.dart';
import 'custome_destination_details.dart';
import 'degree_of_trip.dart';

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const notchRadius = 20.0; // make it bigger so you definitely see it
    final Path path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height / 2 - notchRadius);
    path.arcToPoint(
      Offset(size.width, size.height / 2 + notchRadius),
      radius: Radius.circular(notchRadius),
      clockwise: false,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, size.height / 2 + notchRadius);
    path.arcToPoint(
      Offset(0, size.height / 2 - notchRadius),
      radius: Radius.circular(notchRadius),
      clockwise: false,
    );
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> old) => false;
}

class TicketWidget extends StatelessWidget {
  final String? fromArea, toArea,dateArrivee,dateSatrtt,allTime,price;
  final int? idd;

  const TicketWidget({Key? key,this.idd, this.fromArea, this.toArea,this.dateSatrtt,this.dateArrivee,this.allTime,this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize=MediaQuery.of(context).size;

    return PhysicalShape(
      clipper: TicketClipper(),
      elevation: 6,
      color: Colors.white,
      shadowColor: Colors.black,
      clipBehavior: Clip.antiAlias,
      child: Container(
        color: Colors.white54,
        child: Column(children: [
          //degree of trip
           DegreeOfTrip(id:idd ,),
          SizedBox(height: screenSize.height*0.02,),
          //destination details
          CustomeDestinationDetails(fromArea: fromArea,toArea: toArea,dateArrive: dateArrivee,dateStart:dateSatrtt ,overallTime: allTime,),
          //reservation
          ReservationTripDetails(price: "$price",idTrip: idd,)
        ],),
      ),
    );
  }
}
