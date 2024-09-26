import 'package:artificial_intelligence/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

// void showDatePicker(BuildContext context) {
//   showModalBottomSheet(
//     context: context,
//     backgroundColor: Colors.white,
//     shape:const LinearBorder(),
//     builder: (BuildContext builder) {
//       return SizedBox(
//         height: 240,
//         child: Column(
//           children: <Widget>[
//             Padding(
//               padding: EdgeInsets.all(10.r),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text('Done',style: TextStyle(
//                     fontSize: 16.sp,
//                     fontWeight: FontWeight.w500,
//                     color: Color(0xff777576),
//                   ),),
//                   Text('Cancel',style: TextStyle(
//                     fontSize: 16.sp,
//                     fontWeight: FontWeight.w500,
//                     color: Color(0xff777576),
//                   ),),
//                 ],),
//             ),
//             Divider(
//               thickness: 1.h,
//               color: Color(0xff777576),
//             ),
//             SizedBox(height: 8.h,),
//             Expanded(
//               child: Stack(
//                 children: [
//                   CupertinoTheme(
//                     data:  CupertinoThemeData(
//                       textTheme: CupertinoTextThemeData(
//                         textStyle: TextStyle(
//                           fontSize: 16.sp,
//                           fontWeight: FontWeight.w500,
//                           color:  Colors.red,//
//                         ),
//                         dateTimePickerTextStyle: TextStyle(
//                           fontSize: 16.sp,
//                           fontWeight: FontWeight.w500,
//                           color: const Color(0xff331616),// Adjust font size as needed
//                         ),
//                       ),
//                     ),
//                     child: CupertinoDatePicker(
//                       itemExtent: 45,
//
//                       initialDateTime: DateTime.now(),
//                       dateOrder: DatePickerDateOrder.ymd,
//                       selectionOverlayBuilder: (context, {required columnCount, required selectedIndex}) => Container(
//                         color: Colors.transparent, // Customize the overlay color
//
//                       ),
//                       mode: CupertinoDatePickerMode.date,
//                       onDateTimeChanged: (DateTime newDateTime) {
//                         // Handle date change
//                       },
//                     ),
//                   ),
//                   // Active Date Background (hover effect)
//
//                   // Top Divider
//                   Positioned(
//                     top: 68, // Adjust to match the position of the top of active row
//                     left: 60,
//                     right: 60,
//                     child: Container(
//                       height: 1,
//                       color: Colors.black, // Divider color
//                     ),
//                   ),
//                   // Bottom Divider
//                   Positioned(
//                     top: 96, // Adjust to match the position of the bottom of active row
//                     left: 60,
//                     right: 60,
//                     child: Container(
//                       height: 1,
//                       color: Colors.black, // Divider color
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 12,),
//
//
//           ],
//         ),
//       );
//     },
//   );}