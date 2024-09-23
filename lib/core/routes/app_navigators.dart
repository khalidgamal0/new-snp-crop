// part of 'routes.dart';
import 'package:artificial_intelligence/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper/app_setting.dart';

goToScreenwithAnimation(
    {required Widget screenWidget,
    Object? arguments,
    VoidCallback? onBack,
    bool iswithTheSameRoute = false}) {
  FocusScope.of(Get.context!).unfocus();

  Get.to(
    () => screenWidget,
    duration: const Duration(milliseconds: 900),
    transition: !isArabic
        ? Transition.leftToRightWithFade
        : Transition.rightToLeftWithFade,
    curve: Curves.easeInOutCubicEmphasized,
    arguments: arguments,
  );
}

goToScreen(
    {required ScreenNames screenName,
    Object? arguments,
    VoidCallback? onBack,
    bool iswithTheSameRoute = false}) {
  String screenString = screenName.name;
  FocusScope.of(Get.context!).unfocus();
  var currentRoute = Get.currentRoute;
  if (currentRoute != screenString || iswithTheSameRoute) {
    Navigator.pushNamed(Get.context!, screenString, arguments: arguments)
        .then((_) {
      // callback function when navigating back
      if (onBack != null) {
        onBack();
      }
    });
  }
}

goBack() {
  FocusScope.of(Get.context!).unfocus();
  Navigator.pop(Get.context!);
}

// replace the current screen with new screen
goToScreenpopAndPushNamed({required ScreenNames screenName, Object? arguments}) {
  String screenNames = screenName.name;
  FocusScope.of(Get.context!).unfocus();
  Navigator.pushReplacementNamed(Get.context!, screenNames,
      arguments: arguments);
}

//go back until reach specific screen
popUntilScreen({required ScreenNames screenName}) {
  String screenString = screenName.name;
  FocusScope.of(Get.context!).unfocus();
  Navigator.of(Get.context!).popUntil(ModalRoute.withName(screenString));
}

//go forward and remove from back stack until reach specific screen
goToWithRemoveRoute({required ScreenNames screenName, Object? arguments}) {
  FocusScope.of(Get.context!).unfocus();
  var currentRoute = Get.currentRoute;
  String screenString = screenName.name;
  if (currentRoute != screenString) {
    Navigator.of(Get.context!).pushNamedAndRemoveUntil(
        screenString, (Route<dynamic> route) => false,
        arguments: arguments);
  }
}

goBackBottomNavigation() {
  FocusScope.of(Get.context!).unfocus();
  Navigator.pop(Get.context!);
}


goToWidget({
  required Widget screen,
  VoidCallback? onBack,
}) {
  FocusScope.of(Get.context!).unfocus();
  Navigator.push(Get.context!,
      MaterialPageRoute(builder: (BuildContext context) => screen)).then((_) {
    // callback function when navigating back
    if (onBack != null) {
      onBack();
    }
  });
}