import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:reservation/features/home/data/model/trips_model.dart';

import '../../../../core/services/sharred_prefrence.dart';
import '../../../../core/utils/constance.dart';

class HomeDatasource {
  Dio dio=Dio();

  createTrip({String? fromArea,String? destinationArea,String? price,String? timeOfTravel,String? timeOfReach,String? date,String? driverName,context})async{
    final token = await SharedPrefsService.getToken();
    String urlTrip="${Constance.baseUrl}/trips/";
    final data = {
      "from_area": fromArea,
      "to_area":destinationArea,
      "time_of_travel":timeOfTravel,
      "time_of_reach": timeOfReach,
      "price": price,
      "date": date,
      "driver_name": driverName
    };

    try {
      Response response = await dio.post(urlTrip, data: data,options: Options(
        headers: {
          'Authorization': 'Bearer $token'
        }
      ));
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("تم اضافة الرحله")));
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("تم اضافة الرحله")));

    } on DioException catch (e) {
      if (e.response != null) {
        // Handle 400 Bad Request and other errors
        if (e.response!.statusCode == 400 || e.response!.statusCode==401) {
          print("Error ${e.response!.statusCode}: ${e.response!.data}");

          // Try to extract message from response body
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("خطا فى السيرفر")));
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

  //get all trips
  Future<List<TripsModel>?> getTrips({required BuildContext context}) async {
    final token = await SharedPrefsService.getToken();
    String urlTrips = "${Constance.baseUrl}/trips/";

    try {
      Response response = await dio.get(urlTrips, options: Options(headers: {'Authorization': 'Bearer $token'}),);

      if (response.statusCode == 200 || response.statusCode == 201) {
        List<dynamic> data = response.data;
        final tripsList = data.map((item) => TripsModel.fromJson(item)).toList();

        // Print all driver names
        for (var trip in tripsList) {
          print("Driver Name: ${trip.driverName}");
        }

        return tripsList;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("فشل فى تحميل البيانات")),
        );
      }
    } on DioException catch (e) {
      if (e.response != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("خطأ من السيرفر: ${e.response!.statusCode}")),
        );
        print("Error ${e.response!.statusCode}: ${e.response!.data}");
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("تأكد من وجود اتصال بالإنترنت")),
        );
        print("Network error: $e");
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("حدث خطأ غير متوقع")),
      );
      print("Unexpected error: $e");
    }

    return null;
  }

}