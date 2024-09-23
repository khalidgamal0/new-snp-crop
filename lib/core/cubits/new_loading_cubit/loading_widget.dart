// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// import 'new_loading.dart';
// import 'new_loading_state.dart';

// class LoadingWidget extends StatefulWidget {
//   const LoadingWidget({
//     super.key,
//     required this.cubit,
//     required this.child,
//     this.loaderUI,
//     this.takeFullScreen = true,
//     this.showColordBackGround = false,
//     this.isTransparent = false,
//   });

//   final Widget child;
//   final NewLoading cubit;
//   final Widget? loaderUI;
//   final bool takeFullScreen, showColordBackGround, isTransparent;

//   @override
//   State<LoadingWidget> createState() => _LoadingWidgetState();
// }

// class _LoadingWidgetState extends State<LoadingWidget>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 2),
//     )..repeat();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<NewLoading, NewLoadingState>(
//       bloc: widget.cubit,
//       builder: (context, state) => Stack(
//         alignment: Alignment.center,
//         children: [
//           AbsorbPointer(
//             absorbing: state is ShowLoading ? true : false,
//             child: widget.child,
//           ),
//           state is ShowLoading
//               ? widget.takeFullScreen
//                   ? Center(
//                       child: Container(
//                           width: 1.sw,
//                           height: 1.sh,
//                           alignment: Alignment.center,
//                           color: widget.isTransparent
//                               ? Colors.transparent
//                               : AppColors.primary.withOpacity(
//                                   widget.showColordBackGround ? .99 : .1),
//                           child: widget.loaderUI ??
//                               RotationTransition(
//                                 turns: _controller,
//                                 child: SvgPicture.asset(
//                                   AppImages.logo,
//                                   width: 100.w,
//                                   height: 100.h,
//                                   color: widget.showColordBackGround
//                                       ? Colors.white
//                                       : AppColors.primary,
//                                 ),
//                               )),
//                     )
//                   : Positioned.fill(
//                       child: Container(
//                         alignment: Alignment.center,
//                         color: widget.isTransparent
//                             ? Colors.transparent
//                             : AppColors.primary.withOpacity(
//                                 widget.showColordBackGround ? .99 : .1),
//                         child: widget.loaderUI ??
//                             RotationTransition(
//                               turns: _controller,
//                               child: SvgPicture.asset(
//                                 AppImages.logo,
//                                 width: 100.w,
//                                 height: 100.h,
//                                 color: widget.showColordBackGround
//                                     ? Colors.white
//                                     : AppColors.primary,
//                               ),
//                             ),
//                       ),
//                     )
//               : const SizedBox.shrink(),
//         ],
//       ),
//     );
//   }
// }
