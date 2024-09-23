import 'package:artificial_intelligence/core/helper/lang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_navigators.dart';
import '../../utils/app_words.dart';


class AlertType {
  static const String error = 'error';
  static const String success = 'success';
  static const String confirm = 'confirm';
}

class CustomDialog {
  static Future<bool?> showMessage({
    required String txt,
    required String alertType,
    Function? onClick,
    bool barrierDismissible = true,
  }) async {
    return await showDialog(
      barrierDismissible: barrierDismissible,
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          title: Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  txt,
                  // style: AppTextStyles.textStyle16
                  //     .copyWith(fontWeight: FontWeight.w400),
                ),
              ),
              Row(
                mainAxisAlignment: alertType == AlertType.confirm
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      goBack();
                      if (onClick != null) {
                        onClick();
                      }
                    },
                    child: Text(AppWords.ok.tr),
                  ),
                  alertType == AlertType.confirm
                      ? TextButton(
                    onPressed: goBack,
                    child: Text(AppWords.cancel.tr),
                  )
                      : const SizedBox.shrink(),
                ],
              )
            ],
          ),
        );
      },
    );
  }

}
