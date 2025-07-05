// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:reservation/features/home/presentation/view/widgets/time_date.dart';
//
// import '../../../../../core/utils/app_color.dart';
// import '../../../../../core/widgets/custome_elevated_button.dart';
// import 'dropdown_options_destination.dart';
//
// class CustomeContainerSearchAreas extends StatefulWidget {
//   const CustomeContainerSearchAreas({super.key});
//
//   @override
//   State<CustomeContainerSearchAreas> createState() => _CustomeContainerSearchAreasState();
// }
//
// class _CustomeContainerSearchAreasState extends State<CustomeContainerSearchAreas> {
//   String? fromArea,destinationArea;
//   @override
//   Widget build(BuildContext context) {
//     final screenSize=MediaQuery.of(context).size;
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: screenSize.width*0.02),
//       height: screenSize.height*0.65,
//       color: Color(0xffFCFDF5),
//       child: Column(children: [
//         //dates
//         TimeDate(
//           onDateSelected: (selectedDate) {
//             print("Parent received: ${DateFormat.yMMMMd('ar').format(selectedDate)}");
//           },
//         ),
//
//         //from
//         DropdownOptionsDestination(
//           icon: Icon(Icons.location_on_sharp),
//           hintText: "من",
//           onSelected: (value) {
//             setState(() {
//               fromArea = value;
//             });},),
//
//         //destination
//         DropdownOptionsDestination(
//           icon: Icon(Icons.play_arrow),
//           hintText: "الى",
//           onSelected: (value) {
//             setState(() {
//               destinationArea = value;
//             });},),
//         //button
//         SizedBox(
//             width: MediaQuery.of(context).size.width,
//             child: CustomeElevatedButton(ontap: (){
//               print(fromArea);
//               print(destinationArea);
//             },texxt: "بحث",textColor: Colors.white,backgroundColor: AppColor.green,))
//       ],),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reservation/core/routes/app_routes.dart';
import 'package:reservation/features/home/data/model/trips_model.dart';
import 'package:reservation/features/home/presentation/view/widgets/time_date.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/widgets/custome_elevated_button.dart';
import '../../../data/datasource/home_datasource.dart';
import 'dropdown_options_destination.dart';

class CustomeContainerSearchAreas extends StatefulWidget {
  const CustomeContainerSearchAreas({super.key});

  @override
  State<CustomeContainerSearchAreas> createState() => _CustomeContainerSearchAreasState();
}

class _CustomeContainerSearchAreasState extends State<CustomeContainerSearchAreas> {
  String? fromArea, destinationArea;
  DateTime? selectedDate;
  HomeDatasource _homeDatasource=HomeDatasource();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.02),
      height: screenSize.height * 0.65,
      color: const Color(0xffFCFDF5),
      child: Column(
        children: [
          // Date Picker
          TimeDate(
            onDateSelected: (date) {
              setState(() {
                selectedDate = date;
              });
            },
          ),

          // From Area
          DropdownOptionsDestination(
            icon: const Icon(Icons.location_on_sharp),
            hintText: "من",
            onSelected: (value) {
              setState(() {
                fromArea = value;
              });
            },
          ),

          // Destination Area
          DropdownOptionsDestination(
            icon: const Icon(Icons.play_arrow),
            hintText: "إلى",
            onSelected: (value) {
              setState(() {
                destinationArea = value;
              });
            },
          ),

          // Search Button
          SizedBox(
            width: screenSize.width,
            child: CustomeElevatedButton(
              ontap: ()async {
               await _homeDatasource.getTrips(context: context);
                // _homeDatasource.createTrip(
                //   context: context,
                //   date: DateFormat('MMMM d, y', 'ar').format(selectedDate!),
                //   fromArea: fromArea,
                //   destinationArea: destinationArea,
                //   price: "260",
                //   driverName: "Ahmed Saeed",
                //   timeOfReach: "13:00",
                //   timeOfTravel: "6:00"
                // );
                print("From: $fromArea");
                print("To: $destinationArea");
                print("Date: ${selectedDate != null ? DateFormat('MMMM d, y', 'ar').format(selectedDate!) : 'Not selected'}");
                Navigator.of(context).pushNamed(AppRoutes.tripsScreen);
                },
              texxt: "بحث",
              textColor: Colors.white,
              backgroundColor: AppColor.green,
            ),
          )
        ],
      ),
    );
  }
}

