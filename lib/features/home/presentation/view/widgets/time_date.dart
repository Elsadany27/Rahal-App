// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:easy_date_timeline/easy_date_timeline.dart';
//
// class TimeDate extends StatefulWidget {
//   const TimeDate({super.key});
//
//   @override
//   State<TimeDate> createState() => _TimeDateState();
// }
//
// class _TimeDateState extends State<TimeDate> {
//   DateTime _focusedDate = DateTime.now();
//   late DateTime _firstDate;
//   late DateTime _lastDate;
//
//   @override
//   void initState() {
//     super.initState();
//     _updateMonthRange(_focusedDate);
//   }
//
//   void _updateMonthRange(DateTime date) {
//     _firstDate = DateTime(date.year, date.month, 1);
//     _lastDate = DateTime(date.year, date.month + 1, 0);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Padding(
//           padding: EdgeInsets.all(8.0),
//           child: Text(
//             "اختر الشهر",
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 8.0),
//           child: DropdownButton<DateTime>(
//             isExpanded: true,
//             value: DateTime(_focusedDate.year, _focusedDate.month, 1),
//             items: List.generate(12, (index) {
//               final date = DateTime(_focusedDate.year, index + 1, 1);
//               return DropdownMenuItem(
//                 value: date,
//                 child: Text(DateFormat.MMMM('ar').format(date)),
//               );
//             }),
//             onChanged: (date) {
//               if (date != null) {
//                 setState(() {
//                   _focusedDate = date;
//                   _updateMonthRange(date);
//                 });
//               }
//             },
//           ),
//         ),
//         const SizedBox(height: 16),
//         SizedBox(
//           height: 250,
//           child: EasyInfiniteDateTimeLine(
//             firstDate: _firstDate,
//             focusDate: _focusedDate,
//             lastDate: _lastDate,
//             dayProps: const EasyDayProps(width: 64),
//             selectionMode: const SelectionMode.autoCenter(),
//             locale: 'ar',
//             onDateChange: (selectedDate) {
//               setState(() {
//                 _focusedDate = selectedDate;
//               });
//               debugPrint("Selected: ${DateFormat.yMMMd('ar').format(selectedDate)}");
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';

class TimeDate extends StatefulWidget {
  final void Function(DateTime)? onDateSelected;

  const TimeDate({super.key, this.onDateSelected});

  @override
  State<TimeDate> createState() => _TimeDateState();
}

class _TimeDateState extends State<TimeDate> {
  DateTime _focusedDate = DateTime.now();
  late DateTime _firstDate;
  late DateTime _lastDate;

  @override
  void initState() {
    super.initState();
    _updateMonthRange(_focusedDate);
  }

  void _updateMonthRange(DateTime date) {
    _firstDate = DateTime(date.year, date.month, 1);
    _lastDate = DateTime(date.year, date.month + 1, 0);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "اختر الشهر",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: DropdownButton<DateTime>(
            isExpanded: true,
            value: DateTime(_focusedDate.year, _focusedDate.month, 1),
            items: List.generate(12, (index) {
              final date = DateTime(_focusedDate.year, index + 1, 1);
              return DropdownMenuItem(
                value: date,
                child: Text(DateFormat.MMMM('ar').format(date)),
              );
            }),
            onChanged: (date) {
              if (date != null) {
                setState(() {
                  _focusedDate = date;
                  _updateMonthRange(date);
                });
              }
            },
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 250,
          child: EasyInfiniteDateTimeLine(
            firstDate: _firstDate,
            focusDate: _focusedDate,
            lastDate: _lastDate,
            dayProps: const EasyDayProps(width: 64),
            selectionMode: const SelectionMode.autoCenter(),
            locale: 'ar',
            onDateChange: (selectedDate) {
              setState(() {
                _focusedDate = selectedDate;
              });
              debugPrint("Selected: ${DateFormat.yMMMd('ar').format(selectedDate)}");

              // 🔥 Send selected date to parent
              widget.onDateSelected?.call(selectedDate);
            },
          ),
        ),
      ],
    );
  }
}
