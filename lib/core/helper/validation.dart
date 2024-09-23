// import 'arabic_to_english_number.dart';

import 'app_setting.dart';

enum TextFieldValidatorType {
  email,
  password,
  confirmPassword,
  phoneNumber,
  normalText,
  code,
  number,
  name,
  optional,
  firstVisit,
  idNumber,
  required,
  haveNotSensitiveWords,
  emailOrPhone
}

validation(
    {required TextFieldValidatorType type,
    required String value,
    required String firstPasswordForConfirm}) {
  if (type == TextFieldValidatorType.phoneNumber) {
    if (value.isEmpty) {
      return isArabic ? 'مطلوب' : 'required';
    } else if (value.isNotEmpty && !regExpPhone.hasMatch(value)) {
      return isArabic
          ? 'الرجاء إدخال رقم هاتف صحيح يحتوي على 8 إلى 15 رقم'
          : 'Please enter a valid phone number with 8 to 15 digits';
    } else {
      return null;
    }
  } else if (type == TextFieldValidatorType.email) {
    if (value.isEmpty) {
      return isArabic ? 'مطلوب' : '*required';
    } else if (value.isNotEmpty && !regExpEmail.hasMatch(value)) {
      return isArabic ? 'البريد الإلكتروني غير صحيح' : 'invalid email';
    } else {
      return null;
    }
  } else if (type == TextFieldValidatorType.password) {
    if (value.isEmpty) {
      return isArabic ? 'كلمة المرور مطلوبة' : 'password is required';
    } else if (value.length < 8) {
      return isArabic
          ? 'كلمة المرور يجب ان تكون اكبر من 8 حروف'
          : 'password must be greater than 8 digits';
    }
    // else if (!regExpPassword.hasMatch(value)) {
    //   return isArabic
    //       ? 'كلمة المرور يجب أن تحتوي على حرف كبير وحرف صغير ورقم وحرف خاص'
    //       : 'Password must contain at least one uppercase letter, one lowercase letter, one digit, and one special character';
    // }
    else {
      return null;
    }
  } else if (type == TextFieldValidatorType.confirmPassword) {
    if (value.isEmpty) {
      return isArabic ? 'مطلوب' : '*required';
    } else if (value != firstPasswordForConfirm) {
      return isArabic ? 'غير مطابق' : 'dismatch';
    } else {
      return null;
    }
  } else if (type == TextFieldValidatorType.code) {
    if (value.isEmpty) {
      return isArabic ? 'مطلوب' : '*required';
    } else if (value.length != 6) {
      return isArabic ? 'الكود لا بد ان يكون 6 ارقام' : '*must be 6';
    }
  } else if (type == TextFieldValidatorType.optional) {
    return null;
  } else if (type == TextFieldValidatorType.number) {
    if (value.isEmpty) {
      return isArabic ? 'مطلوب' : '*required';
    } else if (!regExpNumbersOnly.hasMatch(value.trim().replaceAll('‎', ''))) {
      print(value.toString());
      return isArabic
          ? 'لا يجب ان يحتوي على حروف خاصة'
          : 'don’t enter special chars';
    } else if (int.tryParse(value) == null || int.tryParse(value)! < 1) {
      return isArabic ? ' أكبر من 1' : 'Number must be greater than 1';
    } else {
      return null;
    }
  } else if (type == TextFieldValidatorType.name) {
    if (value.isEmpty || value.length < 3) {
      return isArabic ? ' مطلوب' : '*required';
    }
    if (!regExpName.hasMatch(value.trim().replaceAll('‎', ''))) {
      print(value.toString());
      return 'حروف فقط';
    }
  } else if (type == TextFieldValidatorType.firstVisit) {
    if (value.isEmpty) {
      return isArabic ? 'مطلوب' : '*required';
    }
  } else if (type == TextFieldValidatorType.idNumber) {
    if (value.isEmpty) {
      return isArabic ? 'مطلوب' : '*required';
    } else if (!RegExp(r'^[1-2]\d{9}$').hasMatch(value)) {
      return isArabic
          ? 'يجب أن يكون 10 أرقام ويبدأ بالرقم 1 أو 2'
          : 'must be 10 numbers and start with 1 or 2';
    }
    // else if (type == TextFieldValidatorType.HaveNotSenstiveWords) {
    //   if (value.isEmpty) {
    //     return 'مطلوب';
    //   } else if (!regExpNumberAndLettersOnly
    //       .hasMatch(value.trim().replaceAll('‎', ''))) {
    //     return 'حروف وأرقام فقط';
    //   }
    // }
    else if (type == TextFieldValidatorType.required) {
      if (value.trim().isEmpty) {
        return isArabic ? 'هذا الحقل مطلوب' : '*required';
      }
    } else {
      return null;
    }
  }
  if (type == TextFieldValidatorType.emailOrPhone) {
    if (value.isEmpty) {
      return isArabic ? 'مطلوب' : '*required';
    } else if (value.isNotEmpty &&
        (!regExpEmail.hasMatch(value) && !regExpPhone.hasMatch(value))) {
      return isArabic
          ? 'الرجاء إدخال بريد إلكتروني أو رقم هاتف صحيح يبدأ بـ 5'
          : 'Please enter a valid email or phone number format starting with 5';
    } else {
      return null;
    }
  }
  if (type == TextFieldValidatorType.haveNotSensitiveWords) {
    if (value.isEmpty) {
      return isArabic ? 'مطلوب' : '*required';
    } else if (!regExpNumberAndLettersOnly
        .hasMatch(value.trim().replaceAll('‎', ''))) {
      return 'حروف وأرقام فقط';
    }
    return null;
  }
  // if ((type == TextFieldValidatorType.serviceRoom)) {
  //   if (value.isEmpty) {
  //     return isArabic ? 'مطلوب' : '*required';
  //   } else if (RegExp(r'[^\s\w]').hasMatch(value)) {
  //     return isArabic
  //         ? 'لا يجب أن يحتوي على حروف أو رموز خاصة'
  //         : 'Should not contain letters or special characters';
  //   } else if (int.tryParse(value) == null || int.parse(value) < 0) {
  //     return isArabic
  //         ? 'يجب أن يكون الرقم أكبر من صفر'
  //         : 'Number must be greater than 0';
  //   }
  //   return null;
  // }
}

// validation(
//     {required TextFieldvalidatorType type,
//     required String value,
//     required String firstPAsswordForConfirm}) {
//   if (type == TextFieldvalidatorType.phoneNumber) {
//     if (value.isEmpty) {
//       return 'هذا الحقل مطلوب';
//     }
//     return null;
//   } else if (type == TextFieldvalidatorType.email) {
//     if (value.isEmpty) {
//       return isArabic ? 'هذا الحقل مطلوب' : '*required';
//     } else if (value.isNotEmpty && !regExpEmail.hasMatch(value)) {
//       return isArabic ? 'البريد الإلكتروني غير صحيح' : 'invalid email';
//     } else {
//       return null;
//     }
//   } else if (type == TextFieldvalidatorType.password) {
//     if (value.isEmpty) {
//       return isArabic ? 'كلمة المرور مطلوبة' : 'password is required';
//     } else if (value.length < 6) {
//       return isArabic
//           ? 'كلمة المرور يجب ان تكون اكبر من 6 حروف'
//           : 'password must be greater than 6 digits';
//     } else if (value.length > 30) {
//       return isArabic
//           ? 'كلمة المرور يجب ان تكون أقل من 30 حرف'
//           : 'password must be less than 30 digits';
//     } else {
//       return null;
//     }
//   } else if (type == TextFieldvalidatorType.confirmPassword) {
//     if (value.isEmpty) {
//       return isArabic ? 'هذا الحقل مطلوب' : '*required';
//     } else if (value != firstPAsswordForConfirm) {
//       return isArabic ? 'غير مطابق' : 'dismatch';
//     } else {
//       return null;
//     }
//   } else if (type == TextFieldvalidatorType.code) {
//     if (value.isEmpty) {
//       return isArabic ? 'هذا الحقل مطلوب' : '*required';
//     } else if (value.length != 6) {
//       return isArabic ? 'الكود لا بد ان يكون 6 ارقام' : '*must be 6';
//     }
//   } else if (type == TextFieldvalidatorType.optional) {
//     return null;
//   } else if (type == TextFieldvalidatorType.number) {
//     if (value.isEmpty) {
//       return isArabic ? 'هذا الحقل مطلوب' : '*required';
//     }
//     if (value.length != 10) {
//       return isArabic
//           ? 'رقم الهوية يجب أن يكون عشرة أرقام فقط'
//           : 'ID must be 10 numbers';
//     }
//     if (!regExpNumber.hasMatch(value.trim().replaceAll('‎', ''))) {
//       print(value.toString());
//       return isArabic
//           ? 'لا يجب ان يحتوي على حروف خاصة'
//           : 'don’t enter special chars';
//     }
//   } else if (type == TextFieldvalidatorType.name) {
//     if (value.isEmpty) {
//       return isArabic ? ' مطلوب' : '*required';
//     }
//     if (!regExpName.hasMatch(value.trim().replaceAll('‎', ''))) {
//       print(value.toString());
//       return 'حروف فقط';
//     }
//   } else if (type == TextFieldvalidatorType.firstVisit) {
//     if (value.isEmpty) {
//       return isArabic ? 'هذا الحقل مطلوب' : '*required';
//     }
//   } else if (type == TextFieldvalidatorType.idNumber) {
//     if (value.isEmpty) {
//       return isArabic ? 'هذا الحقل مطلوب' : '*required';
//     } else if (value.length != 10) {
//       return isArabic ? 'يجب ان يكون 10 ارقام' : 'must be 10 numbers';
//     } else if (type == TextFieldvalidatorType.haveNotSenstiveWords) {
//       if (value.isEmpty) {
//         return 'مطلوب';
//       } else if (!regExpNumberAndLettersOnly
//           .hasMatch(value.trim().replaceAll('‎', ''))) {
//         return 'حروف وأرقام فقط';
//       }
//     } else if (type == TextFieldvalidatorType.required) {
//       if (value.trim().isEmpty) {
//         return isArabic ? 'هذا الحقل مطلوب' : '*required';
//       }
//     } else {
//       return null;
//     }
//   }
// }
