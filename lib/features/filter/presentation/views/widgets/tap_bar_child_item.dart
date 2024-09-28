import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/presentation/widgets/responsive_space.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text_styles.dart';

class TapBarChildItem extends StatelessWidget {
  const TapBarChildItem({
    super.key,
    this.withIcon = false,
    required this.name,
    this.haveBottomBorder = true,
  });

  final bool withIcon, haveBottomBorder;
  final String name;

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
            bottom: BorderSide(
              color: haveBottomBorder
                  ? AppColors.color917F7F.withOpacity(.4)
                  : Colors.transparent,
            ),
          )),
      child: Row(
        children: [
          Text(
            name,
            style: AppTextStyles.textStyle12
                .copyWith(color: AppColors.color514F4F),
          ),
          if (withIcon) ...[
            horizontalSpacer(8),
            SvgPicture.asset(AppImages.notIcon),
          ],
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
