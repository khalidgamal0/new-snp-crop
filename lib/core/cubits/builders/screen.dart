import 'package:flutter/material.dart';

import '../loading_cubit/loading_cubit.dart';
import 'loader_custom/loader_custom.dart';

class Screen extends StatefulWidget {
  final Loading loadingCubit;
  final Widget child;
  final Widget? loaderUI;
  const Screen({
    super.key,
    required this.loadingCubit,
    required this.child,
    this.loaderUI,
  });

  @override
  ScreenState createState() => ScreenState();
}

class ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Stack(
        children: [
          widget.child,
          Loader(
            loading: widget.loadingCubit,
            loader: widget.loaderUI,
          )
        ],
      ),
    );
  }
}
