import 'package:artificial_intelligence/core/presentation/widgets/responsive_space.dart';
import 'package:artificial_intelligence/core/utils/app_colors.dart';
import 'package:artificial_intelligence/core/utils/app_images.dart';
import 'package:artificial_intelligence/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/main_home_widget.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(AppImages.drawerIcon),
        title: Text(
          'الصفحة الرئيسية ',
          style: AppTextStyles.textStyle16,
        ),
        backgroundColor: AppColors.secondary,
        centerTitle: true,
        actions: [Image.asset(AppImages.turnOff), horizontalSpacer(20)],
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.loginBackground),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: const Color(0xff000000).withOpacity(.6),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 42.h),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MainHomeWidget(
                        image: AppImages.mailIcon,
                        title: 'سداد',
                      ),
                      MainHomeWidget(
                        image: AppImages.transferIcon,
                        title: 'التحويلات',
                      ),
                      MainHomeWidget(
                        image: AppImages.accountPersonIcon,
                        title: 'الحسابات',
                      ),
                    ],
                  ),
                  verticalSpacer(27),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MainHomeWidget(
                        image: AppImages.tradeIcon,
                        title: 'التجارة الإلكترونية ',
                      ),
                      MainHomeWidget(
                        image: AppImages.fireiCON,
                        title: 'أرامكو',
                      ),
                      MainHomeWidget(
                        image: AppImages.walletIcon,
                        title: 'بطاقات الشركات',
                      ),
                    ],
                  ),
                  verticalSpacer(27),
                  const Align(
                    alignment: Alignment.topRight,
                    child: MainHomeWidget(
                      image: AppImages.profileIcon,
                      title: 'بطاقات الشركات',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Image.asset(AppImages.homeBottomNav),
    );
  }
}
