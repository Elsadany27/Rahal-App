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
import 'package:reservation/features/home/presentation/view/widgets/time_date.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/widgets/custome_elevated_button.dart';
import 'dropdown_options_destination.dart';

class CustomeContainerSearchAreas extends StatefulWidget {
  const CustomeContainerSearchAreas({super.key});

  @override
  State<CustomeContainerSearchAreas> createState() => _CustomeContainerSearchAreasState();
}

class _CustomeContainerSearchAreasState extends State<CustomeContainerSearchAreas> {
  String? fromArea, destinationArea;
  DateTime? selectedDate;

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
              // print("Selected date: ${DateFormat.yMMMMd('ar').format(date)}");
            },
          ),

          // From Area
          DropdownOptionsDestination(
            icon: const Icon(Icons.location_on_sharp), hintText: "من",
            onSelected: (value) {
              setState(() {
                fromArea = value;
              });
            },),

          // Destination Area
          DropdownOptionsDestination(icon: const Icon(Icons.play_arrow), hintText: "إلى",
            onSelected: (value) {
              setState(() {
                destinationArea = value;
              });
            },),

          // Search Button
          SizedBox(
            width: screenSize.width,
            child: CustomeElevatedButton(
              ontap: () {
                print("From: $fromArea");
                print("To: $destinationArea");
                print("Date: ${selectedDate != null ? DateFormat.yMd('ar').format(selectedDate!) : 'Not selected'}");
              }, texxt: "بحث", textColor: Colors.white, backgroundColor: AppColor.green,),
          )
        ],
      ),
    );
  }
}
