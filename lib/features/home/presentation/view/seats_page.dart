// import 'package:flutter/material.dart';
// import 'package:reservation/core/utils/app_color.dart';
// import 'package:reservation/core/utils/app_image.dart';
// import 'package:reservation/core/widgets/custome_appbar.dart';
// import 'package:reservation/core/widgets/custome_elevated_button.dart';
// import 'package:reservation/features/home/presentation/view/payment_page.dart';
//
// class seatsBusPage extends StatefulWidget {
//   final int? idTrip;
//   const seatsBusPage({Key? key,this.idTrip}) : super(key: key);
//
//   @override
//   State<seatsBusPage> createState() => _seatsBusPageState();
// }
//
// class _seatsBusPageState extends State<seatsBusPage> {
//   List<int> selectedSeats = [];
//
//   final int rows = 10;
//
//   Widget buildSeat(int seatNumber) {
//     bool isSelected = selectedSeats.contains(seatNumber);
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           isSelected
//               ? selectedSeats.remove(seatNumber)
//               : selectedSeats.add(seatNumber);
//         });
//       },
//       child: Container(
//         margin: const EdgeInsets.all(4),
//         width: 40,
//         height: 40,
//         decoration: BoxDecoration(
//           color: isSelected ? AppColor.green : AppColor.balckk,
//           borderRadius: BorderRadius.circular(8),
//           border: Border.all(
//             color: isSelected ? Colors.green : Colors.white,
//             width: 2,
//           ),
//         ),
//         alignment: Alignment.center,
//         child: Text(
//           '$seatNumber',
//           style: TextStyle(
//             color: isSelected ? Colors.black : Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     int seatNumber = 1;
//
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             //appbar
//             CustomeAppbar(texxt: "اختر مقعدك",),
//             //image driver
//             Image.asset(Assets.driverBusImage,height: 100,),
//             //seats
//             Container(
//               // margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
//               padding: const EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 // color: Colors.grey[900],
//                 borderRadius: BorderRadius.circular(16),
//                 // border: Border.all(color: Colors.greenAccent, width: 2),
//               ),
//               child: Column(
//                 children: [
//                   for (int i = 0; i < rows; i++)
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         // Left side seats
//                         Row(
//                           children: [
//                             buildSeat(seatNumber++),
//                             buildSeat(seatNumber++),
//                           ],
//                         ),
//                         // Space (aisle)
//                         const SizedBox(width: 30),
//                         // Right side seats
//                         Row(
//                           children: [
//                             buildSeat(seatNumber++),
//                             buildSeat(seatNumber++),
//                           ],
//                         ),
//                       ],
//                     ),
//                   const SizedBox(height: 20),
//                   Text('المقاعد المختارة: ${selectedSeats.join(', ')}', style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
//
//                  CustomeElevatedButton(ontap: (){
//                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaymentPage(idTrip: widget.idTrip,seats: selectedSeats,),));
//                  },backgroundColor: AppColor.green,textColor:Colors.white,texxt: "تأكيد",)
//                   //
//                   // ElevatedButton(onPressed: (){
//                   //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaymentPage(seats: selectedSeats,),));
//                   // }, child: Text("aa"))
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation/core/utils/app_color.dart';
import 'package:reservation/core/utils/app_image.dart';
import 'package:reservation/core/widgets/custome_appbar.dart';
import 'package:reservation/core/widgets/custome_elevated_button.dart';
import 'package:reservation/features/home/presentation/view%20model/home_state.dart';
import 'package:reservation/features/home/presentation/view/payment_page.dart';
import '../view model/home_cubit.dart';

class SeatsBusPage extends StatefulWidget {
  final int? idTrip;

  const SeatsBusPage({Key? key, this.idTrip}) : super(key: key);

  @override
  State<SeatsBusPage> createState() => _SeatsBusPageState();
}

class _SeatsBusPageState extends State<SeatsBusPage> {
  List<int> selectedSeats = [];

  Widget buildSeat(int seatNumber, List<int> availableSeats) {
    bool isAvailable = availableSeats.contains(seatNumber);
    bool isSelected = selectedSeats.contains(seatNumber);

    return GestureDetector(
      onTap: isAvailable
          ? () {
        setState(() {
          isSelected
              ? selectedSeats.remove(seatNumber)
              : selectedSeats.add(seatNumber);
        });
      }
          : null,
      child: Container(
        margin: const EdgeInsets.all(4),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: isAvailable
              ? (isSelected ? AppColor.green : AppColor.balckk)
              : Colors.grey.shade700,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isAvailable
                ? (isSelected ? Colors.green : Colors.white)
                : Colors.grey,
            width: 2,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          '$seatNumber',
          style: TextStyle(
            color: isAvailable
                ? (isSelected ? Colors.black : Colors.white)
                : Colors.white70,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
  create: (context) => HomeCubit()..getSeatsAvailableCubit(idTrip: widget.idTrip,context: context),
  child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is IsloadingSeats) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SuccessSeats) {
              final List<int>? availableSeats = state.seatsData!.availableSeats;
              final int? totalSeats = state.seatsData!.totalSeats;
              final int rows = (totalSeats! / 4).ceil();
              int seatNumber = 1;

              return Expanded(
                child: ListView(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // AppBar
                     CustomeAppbar(texxt: "اختر مقعدك"),

                    // Driver Image
                    Image.asset(Assets.driverBusImage, height: 100),

                    // Seats Grid
                    Container(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          for (int i = 0; i < rows; i++)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Left Side
                                Row(
                                  children: [
                                    if (seatNumber <= totalSeats)
                                      buildSeat(seatNumber++, availableSeats!),
                                    if (seatNumber <= totalSeats)
                                      buildSeat(seatNumber++, availableSeats!),
                                  ],
                                ),
                                const SizedBox(width: 30),
                                // Right Side
                                Row(
                                  children: [
                                    if (seatNumber <= totalSeats)
                                      buildSeat(seatNumber++, availableSeats!),
                                    if (seatNumber <= totalSeats)
                                      buildSeat(seatNumber++, availableSeats!),
                                  ],
                                ),
                              ],
                            ),
                          const SizedBox(height: 20),

                          // Selected Seat Info
                          Text('المقاعد المختارة: ${selectedSeats.join(', ')}', style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                          Text('المقاعد المتبقيه: ${state.seatsData!.availableCount}', style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                          const SizedBox(height: 10),

                          // Confirm Button
                          CustomeElevatedButton(
                            ontap: () {
                              if (selectedSeats.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text("اختر مقعدًا")));
                                return;
                              }
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PaymentPage(
                                  idTrip: widget.idTrip,
                                  seats: selectedSeats,
                                ),
                              ));
                            },
                            backgroundColor: AppColor.green,
                            textColor: Colors.white,
                            texxt: "تأكيد",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is FailureSeats) {
              return Center(
                child: Text("خطأ: ${state.errorMessage}"),
              );
            } else {
              return const Center(child: Text("لا توجد بيانات"));
            }
          },
        ),
),
      ),
    );
  }
}
