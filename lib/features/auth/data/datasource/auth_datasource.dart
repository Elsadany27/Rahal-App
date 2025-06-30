import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AuthDatasource {
  Dio dio=Dio();

  registerMethod({String? email, String? password}) async {
    String urlRegister = "http://192.168.1.8:8000/register/";
    String? message;

    final data = {
      "email": email,
      "password": password,
    };

    try {
      Response response = await dio.post(urlRegister, data: data);
      if (response.statusCode == 201) {
        message = response.data["message"];
        print("Success: $message");
      }
      return message;
    } on DioException catch (e) {
      if (e.response != null) {
        // Handle 400 Bad Request and other errors
        if (e.response!.statusCode == 400) {
          // Try to extract message from response body
          message = e.response!.data["error"] ?? "Invalid request data";
          print("Error 400: $message");
          return message;
        } else {
          print("Error ${e.response!.statusCode}: ${e.response!.data}");
        }
      } else {
        print("Network or unexpected error: $e");
      }
    } catch (e) {
      print("Unexpected error: $e");
    }
  }

// registerMethod({String? email,String? password})async{
  //   String urlRegister="http://192.168.1.8:8000/register/";
  //   String? message;
  //   final data={
  //     "email":email,
  //     "password":password
  //   };
  //   try{
  //     Response response= await dio.post(urlRegister,data: data);
  //     if(response.statusCode==201){
  //       message=response.data["message"];
  //       print(message);
  //     }
  //     else if(response.statusCode==400) {
  //       message=response.statusMessage;
  //       print(message);
  //     }
  //   }catch(e){
  //     print(e);
  //   }
  // }
}