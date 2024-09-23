// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';
//
// import '../../cubits/builders/screen.dart';
// import '../../cubits/loading_cubit/loading_cubit.dart';
// import '../../routes/app_navigators.dart';
// import '../../utils/app_colors.dart';
// import '../../utils/app_images.dart';
// import '../../utils/app_words.dart';
//
// class NoInternetConnection extends StatefulWidget {
//   const NoInternetConnection({super.key});
//
//   @override
//   State<NoInternetConnection> createState() => _NoInternetConnectionState();
// }
//
// class _NoInternetConnectionState extends State<NoInternetConnection> {
//   Loading loading = Loading();
//   late InternetConnectionChecker internetConnectionChecker;
//   @override
//   void initState() {
//     internetConnectionChecker = Get.arguments;
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         return false;
//       },
//       child: Screen(
//         loadingCubit: loading,
//         child: Scaffold(
//           appBar: AppBar(
//             backgroundColor: Colors.transparent,
//             toolbarHeight: 0,
//           ),
//           body: SizedBox(
//             width: 1.sw,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 // const BackButtonCustom(),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(AppWords.weAreSorry.tr,
//                         style: TextStyle(
//                           fontSize: 30.sp,
//                           color: AppColors.red,
//                         )),
//                     SizedBox(
//                       width: 20.w,
//                     ),
//                     SvgPicture.asset(
//                       AppImages.noInternet,
//                       width: 30.w,
//                       height: 30.h,
//                       fit: BoxFit.cover,
//                       color: AppColors.red,
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 15.h,
//                 ),
//                 Text(
//                   AppWords.noInternetConnection.tr,
//                   style: TextStyle(
//                       color: const Color(0xff4D5F65), fontSize: 15.sp),
//                 ),
//                 SizedBox(
//                   height: 69.h,
//                 ),
//                 SizedBox(
//                   // height: 86.h,
//                     child: AppButton(
//                       title: AppWords.reconnect.tr,
//                       onPress: () async {
//                         if (await internetConnectionChecker.hasConnection) {
//                           goBack();
//                         }
//                       },
//                     ))
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
