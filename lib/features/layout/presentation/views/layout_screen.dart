import 'package:artificial_intelligence/core/presentation/widgets/responsive_space.dart';
import 'package:artificial_intelligence/core/utils/app_colors.dart';
import 'package:artificial_intelligence/core/utils/app_images.dart';
import 'package:artificial_intelligence/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/presentation/screens/drawer_screen.dart';
import '../../../../core/routes/app_navigators.dart';
import '../../../account_summary/presentation/views/account_summary_screen.dart';
import 'widgets/main_home_widget.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

final GlobalKey<ScaffoldState> drawerKey = GlobalKey();

class _LayoutScreenState extends State<LayoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: drawerKey,
      drawer: const DrawerScreen(),
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              drawerKey.currentState!.openDrawer();
            },
            child: Image.asset(AppImages.drawerIcon)),
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
                  Padding(
                    padding:  EdgeInsets.only(left: 15.w,right: 25.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const MainHomeWidget(
                          image: AppImages.mailIcon,
                          title: 'سداد',
                        ),
                        const MainHomeWidget(
                          image: AppImages.transferIcon,
                          title: 'التحويلات',
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const MainHomeWidget(
                            image: AppImages.accountPersonIcon,
                            title: 'الحسابات',
                          ),
                        ),
                      ],
                    ),
                  ),
                  verticalSpacer(27),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MainHomeWidget(
                        image: AppImages.tradeIcon,
                        title: 'التجارة الإلكترونية',
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
                      textAlign: TextAlign.center,
                      image: AppImages.profileIcon,
                      title: 'إعدادات \nالملف الشخصي',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Stack(
        children: [
          Image.asset(AppImages.homeBottomNav),
          GestureDetector(
            onTap: (){
              goToWidget(screen: const AccountSummaryScreen());
            },
            child:  Container(
              color: Colors.transparent,
              width: 70,
              height: 75,
            ),
          )
        ],
      ),
    );
  }
}
