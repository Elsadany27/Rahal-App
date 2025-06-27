import 'package:flutter/material.dart';
import 'package:reservation/core/utils/app_color.dart';

class TermsCheckbox extends StatelessWidget {
  final bool? value;
  final ValueChanged<bool?> onChanged;

  const TermsCheckbox({Key? key, required this.value, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            'من خلال الاستمرار فأنك توافق على الشروط والاحكام',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: AppColor.green,
            ),
            textDirection: TextDirection.rtl,
          ),
        ),
        Checkbox(
          activeColor: AppColor.green,
          value: value ?? false,
          onChanged: onChanged,
        ),
      ],
    );
  }
}