import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'core/helper/lang.dart';
import 'core/utils/app_theme.dart';
import 'core/utils/app_words.dart';
import 'features/splash/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.currentLocale});
  final Locale currentLocale;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(
        375,
        812,
      ),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, widget) => GetMaterialApp(
        locale: currentLocale,
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('ar'),
        ],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        translations: Lang(),
        debugShowCheckedModeBanner: false,
        title: AppWords.appName.name,
        theme: appLightTheme(),
        home: const SplashScreen(),
        // routes: appRoutes(context),
      ),
    );
  }
}
