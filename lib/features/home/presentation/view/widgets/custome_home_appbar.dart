import 'package:flutter/material.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_image.dart';
import '../../../../../core/services/sharred_prefrence.dart';

class CustomeHomeAppbar extends StatefulWidget {
  const CustomeHomeAppbar({super.key});

  @override
  State<CustomeHomeAppbar> createState() => _CustomeHomeAppbarState();
}

class _CustomeHomeAppbarState extends State<CustomeHomeAppbar> {
  String userName = "الضيف";

  @override
  void initState() {
    super.initState();
    loadUserName();
  }

  void loadUserName() async {
    final savedName = await SharedPrefsService.getName();
    if (savedName != null && mounted) {
      setState(() {
        userName = savedName;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return ListTile(
      title: Text(
        "مرحبا",
        textDirection: TextDirection.rtl,
        style: TextStyle(
          color: AppColor.blackLight,
          fontWeight: FontWeight.w700,
          fontSize: screenSize.width * 0.04,
        ),
      ),
      subtitle: Text(
        userName,
        textDirection: TextDirection.rtl,
        style: TextStyle(
          color: AppColor.blackLight,
          fontWeight: FontWeight.w500,
          fontSize: screenSize.width * 0.04,
        ),
      ),
      trailing: CircleAvatar(
        radius: 25,
        backgroundImage: AssetImage(Assets.profileImage),
      ),
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.notifications_none,
          color: AppColor.green,
          size: screenSize.height * 0.04,
        ),
      ),
    );
  }
}
