import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class AccountDetailsItem extends StatelessWidget {
  const AccountDetailsItem({
    super.key,  this.isFinal=false, required this.name, required this.value,
  });
  final bool isFinal;
  final String name,value;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: AppColors.color917F7F.withOpacity(.4),
          ),
          bottom: BorderSide(
            color: isFinal ? AppColors.color917F7F.withOpacity(.4) : Colors.transparent,
          ),
        ),
      ),
      child: Row(

        children: [
          Text(
            name,
            style: AppTextStyles.textStyle12
                .copyWith(color: AppColors.color514F4F),
          ),
          Expanded(
            child: Text(
              textAlign: TextAlign.end,
              value,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.textStyle12
                  .copyWith(color: AppColors.color514F4F),
            ),
          ),
        ],
      ),
    );
  }
}
