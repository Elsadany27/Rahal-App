import 'package:flutter/material.dart';

class DropdownOptionsDestination extends StatefulWidget {
  final Function(String?) onSelected;
  String? hintText;
  Icon? icon;

  DropdownOptionsDestination({Key? key,this.icon, required this.onSelected, required this.hintText,}) : super(key: key);

  @override
  _DropdownOptionsDestinationState createState() =>
      _DropdownOptionsDestinationState();
}

class _DropdownOptionsDestinationState
    extends State<DropdownOptionsDestination> {
  String? selecteddestination;
  final List<String> areas = [
    'القاهره',
    'الاسكندريه',
    "المنصوره",
    "العين السخنه",
    "شرم الشيخ",
    "الغردقه",
    "مرسي مطروح"
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isSmallDevice = screenWidth < 400;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04,
          vertical: screenHeight * 0.01,
        ),
        margin: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: DropdownButton<String>(
          value: selecteddestination,
          isExpanded: true,
          underline: SizedBox(),
          icon: Icon(Icons.arrow_drop_down, size: screenWidth * 0.06),
          hint: Row(
            children: [
              widget.icon!,
              // Icon(Widget.icon, color: Colors.grey, size: screenWidth * 0.05),
              SizedBox(width: screenWidth * 0.02),
              Expanded(
                child: Text(
                  '${widget.hintText}',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: isSmallDevice ? 12 : 14,
                  ),
                ),
              ),
            ],
          ),
          items: areas.map((String area) {
            return DropdownMenuItem<String>(
              value: area,
              child: Row(
                children: [
                  Icon(Icons.location_on,
                      color: Colors.green, size: screenWidth * 0.05),
                  SizedBox(width: screenWidth * 0.02),
                  Expanded(
                    child: Text(
                      area,
                      style: TextStyle(
                        fontSize: isSmallDevice ? 13 : 15,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selecteddestination = newValue;
            });
            widget.onSelected(newValue);
          },
        ),
      ),
    );
  }
}
