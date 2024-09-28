import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/presentation/widgets/responsive_space.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class LastTransactionsItem extends StatelessWidget {
  const LastTransactionsItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: AppColors.color917F7F.withOpacity(.4),
          ),
        ),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'تحويل داخلي صادر',
                style: AppTextStyles.textStyle12,
              ),
              verticalSpacer(4),
              Text(
                '2023-12-18',
                style: AppTextStyles.textStyle10.copyWith(color: Colors.black),
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'SAR 3.00-',
                style: AppTextStyles.textStyle10
                    .copyWith(color: const Color(0xffE63637)),
              ),
              verticalSpacer(4),
              Text(
                'SAR 5.94',
                style: AppTextStyles.textStyle10.copyWith(color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
