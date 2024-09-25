import 'package:artificial_intelligence/core/presentation/widgets/responsive_space.dart';
import 'package:artificial_intelligence/core/utils/app_images.dart';
import 'package:artificial_intelligence/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class MainHomeWidget extends StatelessWidget {
  const MainHomeWidget({
    super.key,required this.image,required this.title,
  });

final String image,title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(image),
        verticalSpacer(4),
        Text(
          title,
          style: AppTextStyles.textStyle14.copyWith(
            color: const Color(0xffFEFEFE),
          ),
        )
      ],
    );
  }
}
