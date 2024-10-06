import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/presentation/widgets/responsive_space.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text_styles.dart';

class AccountItem extends StatelessWidget {
  const AccountItem({
    super.key,  this.isFinal=false, required this.name, required this.id, required this.price, required this.status, this.onTap,
  });
final bool isFinal;
final String name,id,price,status;
final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              top: BorderSide(
                color: AppColors.color917F7F.withOpacity(.4),
          ),

          bottom: BorderSide(
            color:isFinal? AppColors.color917F7F.withOpacity(.4):Colors.transparent,
          ),
          ),
        ),
        child: Row(
          children: [
            Image.asset(AppImages.person),
            horizontalSpacer(19),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25.h,
                    child: RichText(

                      text: TextSpan(
                          text: name,
                          style: AppTextStyles.textStyle12
                              .copyWith(
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w500),
                          children: [
                            TextSpan(
                              text: '    ($status)',
                              style: AppTextStyles.textStyle12.copyWith(
                                  fontFamily: 'Typography',
                                  color: AppColors.color917F7F),
                            )
                          ]),
                    ),
                  ),

                  Text(
                    overflow: TextOverflow.ellipsis,
                    id,
                    style: AppTextStyles.textStyle12
                        .copyWith(color: AppColors.color6A5555),
                  )
                ],
              ),
            ),

            Text(
              'SAR  $price',
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.textStyle12.copyWith(
                color: AppColors.color6A5555,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
