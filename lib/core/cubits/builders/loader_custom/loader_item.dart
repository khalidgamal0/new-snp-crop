import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class LoaderItem extends StatefulWidget {
  const LoaderItem({super.key});

  @override
  State<LoaderItem> createState() => _LoaderItemState();
}

class _LoaderItemState extends State<LoaderItem>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black.withOpacity(.2),
      child: Center(
        child: CupertinoActivityIndicator(
          radius: 30.r,
          // color: AppColors.primary,
        ),
      ),
    );
  }
}
