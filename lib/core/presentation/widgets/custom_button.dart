import 'package:artificial_intelligence/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, this.onTap, this.width, this.height, this.color, this.buttonName, this.style,
  });
  final void Function()? onTap;
  final double? width;
  final double? height;
  final Color? color;
  final String? buttonName;
  final TextStyle ?style;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width?.w??344.w,
        height:height?.h?? 56.h,
        decoration: BoxDecoration(
            color:color?? AppColors.buttonColor,
            borderRadius: BorderRadius.circular(4.r)),
        child: Text(
          buttonName?? 'التالي',
          style:style??AppTextStyles.textStyle22,
        ),
      ),
    );
  }
}
