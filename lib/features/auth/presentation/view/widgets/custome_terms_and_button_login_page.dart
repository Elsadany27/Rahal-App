import 'package:flutter/material.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/widgets/custome_elevated_button.dart';
import 'custome_checkbox.dart';

class CustomeTermsAndButtonLoginPage extends StatefulWidget {
  const CustomeTermsAndButtonLoginPage({super.key});

  @override
  State<CustomeTermsAndButtonLoginPage> createState() => _CustomeTermsAndButtonLoginPageState();
}

class _CustomeTermsAndButtonLoginPageState extends State<CustomeTermsAndButtonLoginPage> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final screenSize=MediaQuery.of(context).size;
    return Column(
      children: [
        TermsCheckbox(
          value: isChecked,
          onChanged: (newValue) {
            setState(() {
              isChecked = newValue ?? false; // handle null
            });
          },
        ),
        SizedBox(height: screenSize.height*0.08,),
        SizedBox(
            width: MediaQuery.of(context).size.width,
            child: CustomeElevatedButton(ontap: () {}, texxt: "تسجيل الدخول", backgroundColor: AppColor.green, textColor: Colors.white,)),
        SizedBox(height: screenSize.height * 0.03),
        SizedBox(height: screenSize.height * 0.05),
      ],
    );
  }
}