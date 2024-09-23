import 'package:artificial_intelligence/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/helper/lang.dart';
import 'core/routes/route_observer.dart';
import 'core/services/local_storage_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //to make Device Orientation portrait only
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await SharedPreference.init();
  // Locale currentLocale = await Lang.getDefaultOrStoredLocal();

  // SystemChrome.setSystemUIOverlayStyle(
  //   const SystemUiOverlayStyle(
  //       systemNavigationBarColor: Colors.white, // navigation bar color
  //       statusBarIconBrightness: Brightness.dark, //icon color in android
  //       statusBarBrightness: Brightness.dark, //icon color in ios
  //       statusBarColor: Colors.transparent,
  //       systemNavigationBarDividerColor: Colors.white),
  // );

  runApp(const MyApp(
    currentLocale: Locale('ar'),
  ));
}
