import 'dart:developer';
import 'package:dio/dio.dart';

class DioHelper {
  static Dio dio= Dio(
    BaseOptions(
        baseUrl: 'https://erpacounting.com/api/',
        receiveDataWhenStatusError: true,
        headers:{
          'Content-Type': 'application/json',
        }
    ),
  );

  // static init() {
  //   dio = Dio(
  //     BaseOptions(
  //       baseUrl: 'https://student.valuxapps.com/api/',
  //       receiveDataWhenStatusError: true,
  //       headers:{
  //         'Content-Type': 'application/json',
  //       }
  //     ),
  //   );
  // }

  static Future<Map<String,dynamic>> postData(
      {
        required String endPoint,
        Map<String, dynamic>? query,
        required Map<String, dynamic> data,
      }) async {
    var response= await  dio.post(
      endPoint,
      queryParameters: query,
      data: data,
    );
    log(response.data.toString());
    return response.data;
  }

  static Future<Map<String,dynamic>> getData({
    required String endPoint,
    Map<String, dynamic>? query,

  }) async {
    var response= await dio.get(endPoint, queryParameters: query);
    log(response.data.toString());

    return response.data;
  }

  // static Future<Response> putData({
  //   @required String? methodUrl,
  //   Map<String, dynamic>? query,
  //   @required Map<String, dynamic>? data,
  //   String lang = 'en',
  //   String? token,
  // }) async {
  //   dio.options.headers = {
  //     'lang': lang,
  //     'Content-Type': 'application/json',
  //     'Authorization': token ?? '',
  //   };
  //   return dio.put(
  //     methodUrl!,
  //     queryParameters: query,
  //     data: data,
  //   );
  // }

}


