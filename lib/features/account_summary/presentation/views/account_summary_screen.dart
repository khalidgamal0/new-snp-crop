import 'package:artificial_intelligence/core/presentation/screens/drawer_screen.dart';
import 'package:artificial_intelligence/core/routes/app_navigators.dart';
import 'package:artificial_intelligence/features/account_summary/presentation/views/widgets/accoun_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/presentation/widgets/responsive_space.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_text_styles.dart';
import 'account_details_screen.dart';

class AccountSummaryScreen extends StatefulWidget {
  const AccountSummaryScreen({super.key});

  @override
  State<AccountSummaryScreen> createState() => _AccountSummaryScreenState();
}

final GlobalKey<ScaffoldState> drawerKey = GlobalKey();

class _AccountSummaryScreenState extends State<AccountSummaryScreen> {
  bool isOpen = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: drawerKey,
      drawer: const DrawerScreen(),
      backgroundColor: const Color(0xffEEEDEB),
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              drawerKey.currentState!.openDrawer();
            },
            child: Image.asset(AppImages.drawerIcon)),
        title: Text(
          'ملخص الحساب',
          style: AppTextStyles.textStyle16,
        ),
        backgroundColor: AppColors.secondary,
        centerTitle: true,
        actions: [
          GestureDetector(
              onTap: () {
                goBack();
              },
              child: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              )),
          horizontalSpacer(20)
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 22.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'الحسابات الجارية',
                  style:
                      AppTextStyles.textStyle16.copyWith(color: Colors.black),
                ),
                GestureDetector(
                    onTap: () {
                      isOpen = !isOpen;
                      setState(() {});
                    },
                    child: SvgPicture.asset(AppImages.arrowUp)),
              ],
            ),
          ),
          // if(isOpen)
          ...[
            const AccountItem(
              name: 'Empty',
              id: '01400019038001',
              price: '0.00',
              status: 'مغلق',
            ),
            AccountItem(
              isFinal: true,
              name: 'Empty',
              id: '27400000535107',
              price: '5.94',
              status: 'نشط',
              onTap: () {
                goToWidget(screen: const AccountDetailsScreen());
              },
            ),
          ],
          Padding(
            padding: EdgeInsets.all(16.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'الحسابات الإخري',
                  style: AppTextStyles.textStyle16.copyWith(
                    color: AppColors.color514F4F,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SvgPicture.asset(AppImages.arrowUp)
              ],
            ),
          ),
          Divider(
            color: AppColors.color917F7F.withOpacity(.4),
          ),
          Padding(
            padding: EdgeInsets.all(16.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'كشوف المرتبات',
                  style: AppTextStyles.textStyle16.copyWith(
                    color: AppColors.color514F4F,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SvgPicture.asset(AppImages.arrowUp)
              ],
            ),
          ),
          Divider(
            color: AppColors.color917F7F.withOpacity(.4),
          )
        ],
      ),
    );
  }
}
