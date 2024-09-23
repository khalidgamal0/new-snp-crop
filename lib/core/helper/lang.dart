import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../lang/ar.dart';
import '../lang/en.dart';
import '../services/local_storage_services.dart';
import '../utils/app_words.dart';
import 'app_keys.dart';
import 'app_setting.dart';

// extension T on String {
//   String get trans {
//     String? word = tr;
//     //  if (word != null) {
//     return word;
//     // } else {
//     //   return 'none';
//     // }
//   }
// }

extension T on AppWords {
  String get tr {
    return name.tr;
  }
}

class Lang extends Translations {
  static Future<Locale> getDefaultOrStoredLocal() async {
    // Locale appLocale = const Locale('ar'); //set defualt
    Locale appLocale =
        Locale(Get.deviceLocale?.languageCode ?? 'ar'); //set defualt

    if (SharedPreference.getData(key: AppKeys.languageCode) == null) {
      String storedLocal = appLocale == const Locale('ar') ? 'ar' : 'en';
      // SharedPreference.setData(key: AppKeys.languageCode, value: 'ar');
      SharedPreference.setData(key: AppKeys.languageCode, value: storedLocal);
      globalLang = appLocale.toString(); //set globalLang
      // isArabic = true; //set isArabic
      isArabic = storedLocal == "ar" ? true : false; //set isArabic

      log("appLocale $appLocale");

      return appLocale; //return default
    } else {
      appLocale = Locale(
          SharedPreference.getData(key: AppKeys.languageCode)); //get stored
      globalLang = appLocale.toString(); //set globalLang
      isArabic = globalLang == "ar" ? true : false; //set isArabic
      log("appLocale $appLocale");

      return appLocale; //return stored
    }
  }

  static changeLang(Locale locale) async {
    Locale appLocale = await getDefaultOrStoredLocal();
    if (appLocale == locale) {
      return;
    }
    if (locale == const Locale("ar")) {
      Get.updateLocale(locale);
      appLocale = const Locale("ar");
      await SharedPreference.setData(key: AppKeys.languageCode, value: 'ar');
      globalLang = appLocale.toString();
      isArabic = true;
      await SharedPreference.setData(key: AppKeys.countryCode, value: '');
    } else {
      Get.updateLocale(locale);
      appLocale = const Locale("en");
      globalLang = appLocale.toString();
      isArabic = false;
      await SharedPreference.setData(key: AppKeys.languageCode, value: 'en');
      await SharedPreference.setData(key: AppKeys.countryCode, value: 'US');
    }
    log("appLocale $appLocale");

    // AppFonts.mainfont = isArabic ? "Droid" : "Roboto";
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'en': en.map((key, value) => MapEntry(key.name, value)),
        'ar': ar.map((key, value) => MapEntry(key.name, value)),
      };

  static final locales = [
    const Locale('en', 'US'),
    const Locale('ar', ''),
  ];
}
