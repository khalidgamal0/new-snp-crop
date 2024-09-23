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
  RouteObserver() = MyRouteObserver();
  Locale currentLocale = await Lang.getDefaultOrStoredLocal();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white, // navigation bar color
        statusBarIconBrightness: Brightness.dark, //icon color in android
        statusBarBrightness: Brightness.dark, //icon color in ios
        statusBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.white),
  );

  //sentry
  // await SentryFlutter.init(
  //   (options) {
  //     options.dsn =
  //         'https://27b7386e8f599057faf55a208753a08e@o4507129166888960.ingest.us.sentry.io/4507662654111744';
  //   },
  //   appRunner: () => runApp(MyApp(currentLocale: currentLocale)),
  // );

  runApp(MyApp(
    currentLocale: currentLocale,
  ));
}
