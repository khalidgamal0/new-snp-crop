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
import '../../../splash/cubit/splash_cubit.dart';
import 'account_details_screen.dart';

class AccountSummaryScreen extends StatefulWidget {
  const AccountSummaryScreen({super.key});

  @override
  State<AccountSummaryScreen> createState() => _AccountSummaryScreenState();
}

class _AccountSummaryScreenState extends State<AccountSummaryScreen> {
  bool isOpen = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEEEDEB),
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {}, child: Image.asset(AppImages.drawerIcon)),
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
      body: SingleChildScrollView(
        child: Column(
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
              // const AccountItem(
              //   name: 'فارغ',
              //   id: '01400019038001',
              //   price: '0.00',
              //   status: 'مغلق',
              // ),
              activeAccountModel != null &&
                  activeAccountModel?.data != null&&
                      activeAccountModel?.data?.isNotEmpty == true
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => AccountItem(
                        isFinal:
                            index == (activeAccountModel!.data!.length - 1),
                        name: activeAccountModel!.data![index].accountName ??
                            'فارغ',
                        id: activeAccountModel!.data![index].accountNumber ??
                            '27400000535107',
                        price:
                            activeAccountModel!.data![index].balance ?? '5.94',
                        status:
                            activeAccountModel!.data![index].status ?? 'نشط',
                        onTap: () {
                          goToWidget(screen:  AccountDetailsScreen(
                            id: activeAccountModel!.data![index].id.toString()??'',
                          ));
                        },
                      ),
                      itemCount: activeAccountModel!.data!.length ?? 0,
                    )
                  : Center(
                      child: Text(
                        'لا يوجد حسابات نشطه في الوقت الحالي ',
                        style: AppTextStyles.textStyle12
                            .copyWith(color: AppColors.color514F4F),
                      ),
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
      ),
    );
  }
}
