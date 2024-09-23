import 'dart:convert';
import 'dart:developer' as logger;
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../helper/app_keys.dart';
import '../helper/app_setting.dart';
import '../helper/success_failure_classes.dart';
import '../presentation/widgets/custom_dialog.dart';
import 'local_storage_services.dart';

enum ActionType { get, post, delete }

enum AttachmentType { image, file }

class ApiService {
  static Future<Either<Failure, Success>> callService({
    required ActionType actionType,
    required String apiName,
    Map<String, dynamic>? body,
    bool sendLang = true,
  }) async {
    String url = AppSetting.serviceURL + apiName;
    Map<String, String> headers = serviceHeader(sendLang: sendLang);

    http.Response? response;

    Uri apiUrl = Uri.parse(url);
    if (!checkIfNotLogoin(apiUrl.toString())) {
      String? token = await getStoredToken();
      headers.update('Authorization', (value) => "Bearer $token",
          ifAbsent: () => "Bearer $token");
    }
    logger.log('data URL $url', name: 'URL');
    logger.log('data Header ${json.encode(headers)}', name: 'Header');
    logger.log('data sent with Body: ${json.encode(body)}', name: 'Body');

    try {
      switch (actionType) {
        case ActionType.get:
          response = await http.get(apiUrl, headers: headers);

          //   .timeout(const Duration(seconds: 10), onTimeout: () {
          // CustomDialog.showMessage(
          //     isAcceptRequest: true,
          //     txt:'لقد استغرق الاتصال بالخادم وقت طويل الرجاء التحقق من الشبكه',
          //     alertType: AlertType.error,
          //    );
          // });
          break;
        case ActionType.post:
          response = await http.post(apiUrl,
              headers: headers, body: json.encode(body));
          break;
        case ActionType.delete:
          response = await http.delete(apiUrl, headers: headers);
          break;
      }

      return await handleResponse(response);
    } catch (e, t) {
      logger.log('Error: $e', name: 'Exception');
      logger.log('trace: $t', name: 'Trace');
      logger.log('statusCode: ${response?.statusCode}', name: 'statusCode');
      await CustomDialog.showMessage(
          barrierDismissible: false,
          txt: 'حدث خطأ ما الرجاء التواصل مع فريق الدعم',
          alertType: AlertType.error,
          onClick: () => exit(0));
      // log( 'Error body: ${response?.body}', name: 'Error body: $e');
      return Left(
          Failure(msg: 'Error: $e', status: response?.statusCode ?? 500));
    }
  }

  //----------------------upload attachment-------------------
  static Future<Either<Failure, Success>> uploadAttachment({
    AttachmentType? type,
    File? file,
    File? passport,
    File? schoolCertificate,
    File? image,
    required String endpointName,
    required Map<String, dynamic> map,
    bool sendLang = true,
  }) async {
    String url = '${AppSetting.serviceURL}$endpointName';
    logger.log('-----------------URL-------------------');
    logger.log('data URL $url', name: 'URL');
    logger.log('---------------------------------------');

    var request = http.MultipartRequest('POST', Uri.parse(url));
    Map<String, String> headers = serviceHeader(sendLang: sendLang);

    String? token = await getStoredToken();
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }

    request.headers.addAll(headers);

    // Attach files if they are not null
    if (passport != null) {
      request.files.add(await http.MultipartFile.fromPath(
        'passport',
        passport.path,
        filename: passport.path.split('/').last,
      ));
    }
    if (schoolCertificate != null) {
      request.files.add(await http.MultipartFile.fromPath(
        'school_certificate',
        schoolCertificate.path,
        filename: schoolCertificate.path.split('/').last,
      ));
    }
    if (image != null) {
      request.files.add(await http.MultipartFile.fromPath(
        'image',
        image.path,
        filename: image.path.split('/').last,
      ));
    }
    if (type != null && file != null) {
      request.files.add(await http.MultipartFile.fromPath(
        type == AttachmentType.image ? 'image' : 'file',
        file.path,
        filename: file.path.split('/').last,
      ));
    }

    map.forEach((key, value) {
      request.fields[key] = value.toString();

      logger.log('key: $key, value: $value', name: 'map');
    });

    try {
      http.StreamedResponse response = await request.send();
      logger.log("message $response", name: 'message');
      String data = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        logger.log('statusCode ${response.statusCode}', name: 'Success');
        logger.log('response ${json.decode(data)}', name: 'response');
        return Right(Success(json.decode(data)));
      } else if (response.statusCode == 302) {
        logger.log('statusCode 302: Redirection detected', name: 'Error');
        logger.log('Redirection URL: ${response.headers['location']}',
            name: 'Redirected to');
        return Left(Failure(msg: 'Redirection occurred', status: 302));
      } else if (response.statusCode == 401) {
        logger.log('statusCode 401: Unauthorized access', name: 'Error');
        logger.log('data: ${json.decode(data)}', name: '401');

        return Left(Failure(msg: 'Unauthorized access', status: 401));
      } else if (response.statusCode == 500) {
        logger.log('statusCode 500:  500', name: '500');
        logger.log('data: ${json.decode(data)}', name: '500');
        return Left(Failure(msg: 'Unauthorized access', status: 500));
      } else {
        logger.log('statusCode ${response.statusCode}', name: 'Error');
        try {
          logger.log(data, name: 'reasonPhrase');
          return Left(
              Failure(msg: json.decode(data), status: response.statusCode));
        } catch (e) {
          logger.log('Error decoding response', name: 'DecodingError');
          return Left(
              Failure(msg: 'Unknown error', status: response.statusCode));
        }
      }
    } catch (e) {
      logger.log('Exception caught: $e', name: 'Exception');
      return Left(Failure(msg: 'Exception occurred', status: 500));
    }
  }

  //----------------------end of upload attachment-------------------

  /// Handles the response from the HTTP request
  static Future<Either<Failure, Success>> handleResponse(
      http.Response response) async {
    logger.log("STATUS CODE = ${response.statusCode}", name: " STATUS CODE");
    logger.log("Response body = ${json.decode(response.body)}",
        name: "Response body");

    switch (response.statusCode) {
      case 200:
      case 201:
        return Right(Success(json.decode(response.body)));
      case 400:
      case 404:
      case 401:
      case 420:
      case 422:
      case 302:
        await CustomDialog.showMessage(
            barrierDismissible: false,
            txt: json.decode(response.body)['errors']['message'],
            alertType: AlertType.error);
        return Left(Failure(
            msg: json.decode(response.body)['errors']['message'],
            status: response.statusCode));

      case 500:
        await CustomDialog.showMessage(
            barrierDismissible: false,
            txt: 'حدث خطأ تقني الرجاء التواصل مع فريق الدعم',
            alertType: AlertType.error,
            onClick: () => exit(0));
        return Left(Failure(
            msg: json.decode(response.body)['errors']['message'],
            status: response.statusCode));

      case 503:
        await CustomDialog.showMessage(
            barrierDismissible: false,
            txt: 'حدث خطأ ما الرجاء الانتظار قليلا وإعادة المحاولة',
            alertType: AlertType.error,
            onClick: () => exit(0));
        return Left(Failure(
            msg: json.decode(response.body)['errors']['message'],
            status: response.statusCode));

      default:
        return Left(Failure(
            msg: json.decode(response.body)['errors']['message'],
            status: response.statusCode));
    }
  }

  static Map<String, String> serviceHeader({bool sendLang = true}) {
    return {
      "Content-Type": 'application/json',
      "Accept": '*/*',
      "Accept-Language": !sendLang
          ? 'ar'
          : isArabic
              ? 'ar'
              : 'en',
    };
  }

  static bool checkIfNotLogoin(String apiurl) {
    return apiurl.contains('otp') || apiurl.contains('lookup');
  }

  static Future<String?> getStoredToken() async {
    String? storedToken = await SharedPreference.getData(key: AppKeys.token);
    return storedToken != "null" ? storedToken : null;
  }

  static String getPlatformName() {
    return kIsWeb ? "Android" : Platform.operatingSystem;
  }
}
