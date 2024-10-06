import 'package:artificial_intelligence/features/account_summary/presentation/views/widgets/accountDetailsItem.dart';
import 'package:artificial_intelligence/features/account_summary/presentation/views/widgets/last_transaction_item.dart';
import 'package:artificial_intelligence/features/filter/presentation/views/filter_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/presentation/widgets/account_item.dart';
import '../../../../core/presentation/widgets/responsive_space.dart';
import '../../../../core/routes/app_navigators.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../splash/cubit/splash_cubit.dart';

class AccountDetailsScreen extends StatelessWidget {
  const AccountDetailsScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..getAccountDetailsById(id: id),
      child: Scaffold(
        backgroundColor: const Color(0xffEEEDEB),
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {}, child: Image.asset(AppImages.drawerIcon)),
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
        body: BlocBuilder<SplashCubit, SplashState>(
          builder: (context, state) {
            SplashCubit cubit=SplashCubit.get(context);
            return
              state is AccountDetailsLoading?
              Center(child: CupertinoActivityIndicator(color: AppColors.secondary,)):state is AccountDetailsSuccess?
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpacer(24),
                  Padding(
                    padding: EdgeInsets.only(right: 16.w),
                    child: Text(
                      'اختر الحساب',
                      style: AppTextStyles.textStyle16
                          .copyWith(color: Colors.black),
                    ),
                  ),
                  verticalSpacer(24),
                  AccountItem(
                    name: cubit.accountDetailsModelApi?.data?.status?? 'نشط',
                    id: cubit.accountDetailsModelApi?.data?.accountNumber ?? '27400000535107',
                    balance: cubit.accountDetailsModelApi?.data?.balance ?? '5.94',
                  ),
                  verticalSpacer(16),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      children: [
                        Text(
                          'تفاصيل الحساب',
                          style: AppTextStyles.textStyle16
                              .copyWith(color: Colors.black),
                        ),
                        const Spacer(),
                        SvgPicture.asset(AppImages.arrowUp),
                      ],
                    ),
                  ),
                  verticalSpacer(16),
                  AccountDetailsItem(
                    name: 'إسم الحساب ',
                    value: cubit.accountDetailsModelApi?.data?.accountName ??
                        'محل وردة النرجس للزهور',
                  ),
                  AccountDetailsItem(
                    name: 'الإسم المختصر ',
                    value: cubit.accountDetailsModelApi?.data?.shortName ?? 'مشتل مكه',
                  ),
                  AccountDetailsItem(
                    name: 'العمله',
                    value: cubit.accountDetailsModelApi?.data?.currencyEn?.name ?? 'SAR',
                  ),
                  AccountDetailsItem(
                    name: 'الحاله',
                    value: cubit.accountDetailsModelApi?.data?.status ?? 'نشط',
                  ),
                  AccountDetailsItem(
                    name: 'رقم حساب الأبيان',
                    value:
                        cubit.accountDetailsModelApi?.data?. iban?? 'SA361000000140012795200',
                  ),
                  AccountDetailsItem(
                    name: 'الرصيد',
                    value: 'SAR ${cubit.accountDetailsModelApi?.data?.balance ?? '4.32'}',
                  ),
                  AccountDetailsItem(
                    name: 'الرصيد الحالي',
                    value:
                        'SAR ${cubit.accountDetailsModelApi?.data?.availableBalance ?? '4.32'}',
                  ),
                  AccountDetailsItem(
                    name: 'حد السحب علي المكشوف',
                    value: 'SAR ${cubit.accountDetailsModelApi?.data?.overdraftLimit ?? '0.00'}',
                  ),
                  AccountDetailsItem(
                    isFinal: true,
                    name: 'المبالغ المحجوزة',
                    value:
                        'SAR ${cubit.accountDetailsModelApi?.data?.reservedBalance ?? '0.00'}',
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
                          onTap: () {
                            goToWidget(screen:  FilterScreen(accountId: cubit.accountDetailsModelApi?.data?.id.toString()??'',));
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
                  if(cubit.accountDetailsModelApi?.data?.lastTransactions?.isNotEmpty==true)
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => LastTransactionsItem(
                      transactionModel: cubit.accountDetailsModelApi?.data?.lastTransactions?[index],
                    ),
                    itemCount: cubit.accountDetailsModelApi?.data?.lastTransactions?.length,
                  )
                ],
              ),
            ):Center(
                child: Text(
                  'جحدث خطأ ما الرجأ المحاوله مره أخري',
                  style: AppTextStyles.textStyle12
                      .copyWith(color: AppColors.color514F4F),
                ),
              );
          },
        ),
      ),
    );
  }
}
