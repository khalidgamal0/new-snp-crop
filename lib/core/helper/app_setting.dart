class AppSetting {
  // /// test
  static const String serviceURL = 'https://utopia.sa/';

// static const String androidVersion = '';
// static const String iosVersion = '';

}

String globalLang = '';
late bool isArabic;
bool isIosTest = true;
// RegExp regExpPhone = RegExp(
//   r'^(009665|9665|\+9665|05|5)(5|0|3|6|4|9|1|8|7)([0-9]{7})+$',
//   caseSensitive: false,
//   multiLine: false,
//);
final regExpPhone = RegExp(r'^\d{8,15}$');

RegExp regExpEmail = RegExp(
  r'(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))+$',
  caseSensitive: false,
  multiLine: false,
);

RegExp regExpPassword = RegExp(
  r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-6])(?=.*[!@#$%^&*()_+\-=\[\]{};:\"\\|,.<>\/?]).+$',
  caseSensitive: false,
  multiLine: false,
);

RegExp regExpName = RegExp(
  r"^[\p{L} ,.'-]*$",
  caseSensitive: false,
  unicode: true,
  dotAll: true,
  multiLine: false,
);

RegExp regExpNumber = RegExp(
  r"^(?:[0]9)?[0-9]{10}$",
  caseSensitive: false,
  unicode: true,
  dotAll: true,
  multiLine: false,
);
RegExp regExpNumbersOnly = RegExp(
  r"^[0-9]*$",
  caseSensitive: false,
  unicode: true,
  dotAll: true,
  multiLine: false,
);
RegExp regExpNumberAndLettersOnly = RegExp(
  r"^(?!\s*$)(\d|\w|[\u0621-\u064A\u0660-\u0669 ])+$",
  caseSensitive: false,
  unicode: true,
  dotAll: true,
  multiLine: false,
);
