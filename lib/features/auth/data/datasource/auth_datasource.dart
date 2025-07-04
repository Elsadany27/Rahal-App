import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:reservation/core/routes/app_routes.dart';
import 'package:reservation/core/utils/constance.dart';

import '../../../../core/services/sharred_prefrence.dart';

class AuthDatasource {
  Dio dio=Dio();

  registerMethod({String? email, String? password,context}) async {
    String urlRegister = "${Constance.baseUrl}/register/";
    String? message;

    final data = {
      "email": email,
      "password": password,
    };

    try {
      Response response = await dio.post(urlRegister, data: data);
      if (response.statusCode == 201) {
        message = response.data["message"];
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$message")));
      Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.loginScreen, (route) => false,);
    } on DioException catch (e) {
      if (e.response != null) {
        // Handle 400 Bad Request and other errors
        if (e.response!.statusCode == 400) {
          // Try to extract message from response body
          message = e.response!.data["error"] ?? "Invalid request data";
          print("Error 400: $message");
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$message")));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("خطا فى السيرفر")));
          print("Error ${e.response!.statusCode}: ${e.response!.data}");
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("تأكد من وجود انترنت")));
        print("Network or unexpected error: $e");
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("خطا فى السيرفر")));
      print("Unexpected error: $e");
    }
  }

  //login
  loginMethod({String? email, String? password,context}) async {
    String? messageLogin;
    String urlLogin = "${Constance.baseUrl}/login/";
    String? token;
    final data = {
      "email": email,
      "password": password,
    };

    try {
      Response response = await dio.post(urlLogin, data: data);
      if (response.statusCode == 200) {
        messageLogin = response.data["message"];
        token=response.data["access"];
        await SharedPrefsService.saveToken(token!);
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$messageLogin")));
      Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.homeScreen, (route) => false,);
    } on DioException catch (e) {
      if (e.response != null) {
        // Handle 400 Bad Request and other errors
        if (e.response!.statusCode == 400 || e.response!.statusCode==401) {
          // Try to extract message from response body
          messageLogin = e.response!.data["detail"] ?? "Invalid request data";
          print("Error 400: $messageLogin");
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$messageLogin")));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("خطا فى السيرفر")));
          print("Error ${e.response!.statusCode}: ${e.response!.data}");
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("تأكد من وجود انترنت")));
        print("Network or unexpected error: $e");
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("خطا فى السيرفر")));
      print("Unexpected error: $e");
    }
  }

}