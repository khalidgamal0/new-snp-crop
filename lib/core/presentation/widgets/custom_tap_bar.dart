import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';
class CustomTabBar extends StatelessWidget {
  final List<String> tabNames;
  final List<Widget> children;

  const CustomTabBar({
    super.key,
    required this.tabNames,
    required this.children,
  });
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabNames.length,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 45.h,
            width: 1.sw,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.secondary),
              color: const Color(0xffF7F7FA),
              borderRadius: BorderRadius.all(Radius.circular(16.r)),
            ),
            child: TabBar(
              tabAlignment:
          TabAlignment.start,
              isScrollable :true,
              labelColor: Colors.white,
              labelPadding: EdgeInsets.zero,
              indicatorColor: AppColors.secondary,
              unselectedLabelColor: AppColors.grey,
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.spMin,
              ),
              tabs: [
                for (var i = 0; i < tabNames.length; i++)
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal:  12.4.w),
                    child: SizedBox(
                        width: .3.sw,
                        child: Tab(text: tabNames[i])),
                  ),
              ],
              indicator: ShapeDecoration(
                color: AppColors.secondary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.r))),
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                for (var i = 0; i < tabNames.length; i++) children[i],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
