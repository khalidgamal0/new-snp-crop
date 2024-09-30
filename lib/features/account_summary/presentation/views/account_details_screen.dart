import 'package:artificial_intelligence/core/presentation/screens/drawer_screen.dart';
import 'package:artificial_intelligence/features/account_summary/presentation/views/widgets/accountDetailsItem.dart';
import 'package:artificial_intelligence/features/account_summary/presentation/views/widgets/last_transaction_item.dart';
import 'package:artificial_intelligence/features/filter/presentation/views/filter_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/presentation/widgets/account_item.dart';
import '../../../../core/presentation/widgets/responsive_space.dart';
import '../../../../core/routes/app_navigators.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../splash/cubit/splash_cubit.dart';

final GlobalKey<ScaffoldState> drawerKey = GlobalKey();

class AccountDetailsScreen extends StatelessWidget {
  const AccountDetailsScreen({super.key});

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
          'تفاصيل الحساب',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpacer(24),
            Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: Text(
                'اختر الحساب',
                style: AppTextStyles.textStyle16.copyWith(color: Colors.black),
              ),
            ),
            verticalSpacer(24),
             AccountItem(
              name:accountDetailsModel?.status??'نشط',id:accountDetailsModel?.accountNumber??'27400000535107' ,balance:accountDetailsModel?.outerBalance??'5.94' ,


            ),
            verticalSpacer(16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  Text(
                    'تفاصيل الحساب',
                    style: AppTextStyles.textStyle16.copyWith(color: Colors.black),
                  ),
                  const Spacer(),
                  SvgPicture.asset(AppImages.arrowUp),
                ],
              ),
            ),
            verticalSpacer(16),
            AccountDetailsItem(
              name:'إسم الحساب ',
              value:accountDetailsModel?.innerName??'محل وردة النرجس للزهور'  ,
            ),
            AccountDetailsItem(
              name:'الإسم المختصر ' ,
              value: accountDetailsModel?.observationName??'مشتل مكه',
            ),
            AccountDetailsItem(
              name:'العمله' ,
              value:  accountDetailsModel?.currency??'SAR',
            ),
            AccountDetailsItem(
              name:'الحاله' ,
              value:  accountDetailsModel?.status??'نشط',
            ),
            AccountDetailsItem(
              name:'رقم حساب الأبيان' ,
              value: accountDetailsModel?.iPan?? 'SA361000000140012795200',
            ),
            AccountDetailsItem(
              name:'الرصيد' ,
              value: 'SAR ${accountDetailsModel?.balance ?? '4.32'}',
            ),
            AccountDetailsItem(
              name:'الرصيد الحالي' ,
              value:  'SAR ${accountDetailsModel?.currentBalance ?? '4.32'}',
            ),
            AccountDetailsItem(
              name:'حد السحب علي المكشوف' ,
              value:  'SAR ${accountDetailsModel?.overLimited ?? '0.00'}',
            ),
            AccountDetailsItem(
              isFinal: true,
              name:'المبالغ المحجوزة' ,
              value:  'SAR ${accountDetailsModel?.reservedAmount ?? '0.00'}',
            ),

            verticalSpacer(16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  Text(
                    'المعاملات الأخيرة',
                    style: AppTextStyles.textStyle14.copyWith(
                        fontWeight: FontWeight.w400, color: Colors.black),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: (){
                      goToWidget(screen: const FilterScreen());
                    },
                    child: Row(
                      children: [
                        Text(
                          'التفاصيل',
                          style: AppTextStyles.textStyle14
                              .copyWith(color: AppColors.secondary),
                        ),
                        horizontalSpacer(8),
                        SvgPicture.asset(AppImages.clockSvg),
                      ],
                    ),
                  )
                ],
              ),
            ),
            verticalSpacer(16),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) =>  LastTransactionsItem(transactionModel:transactionModel[index],),
              itemCount: transactionModel.length,
            )
          ],
        ),
      ),
    );
  }
}

