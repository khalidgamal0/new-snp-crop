import 'package:artificial_intelligence/core/presentation/widgets/responsive_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_text_styles.dart';

class AccountItem extends StatelessWidget {
  const AccountItem({
    super.key,
    required this.name, required this.id, required this.balance,
  });
 final String name,id,balance;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: AppColors.color917F7F.withOpacity(.4),
          )),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                    text: '-',
                    style: AppTextStyles.textStyle12
                        .copyWith(fontWeight: FontWeight.w500),
                    children: [
                      TextSpan(
                        text:name,

                        style: AppTextStyles.textStyle12.copyWith(
                            overflow: TextOverflow.ellipsis,
                            fontFamily: 'Typography',
                            color: AppColors.color917F7F),
                      )
                    ]),
              ),
              Text(
               id,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.textStyle12
                    .copyWith(color: AppColors.color6A5555),
              )
            ],
          ),

          Expanded(

            child: Text(
              textAlign: TextAlign.end,
              overflow: TextOverflow.ellipsis,
              'SAR $balance',
              style: AppTextStyles.textStyle12.copyWith(
                color: AppColors.color6A5555,
              ),
            ),
          ),
          horizontalSpacer(16),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
