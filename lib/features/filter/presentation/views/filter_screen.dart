import 'package:artificial_intelligence/features/account_summary/presentation/views/widgets/last_transaction_item.dart';
import 'package:artificial_intelligence/features/filter/presentation/views/web_view.dart';
import 'package:artificial_intelligence/features/filter/presentation/views/widgets/tap_bar_child_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import '../../../../core/presentation/widgets/account_item.dart';
import '../../../../core/presentation/widgets/custom_button.dart';
import '../../../../core/presentation/widgets/responsive_space.dart';
import '../../../../core/routes/app_navigators.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../splash/cubit/splash_cubit.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.accountId});

  final String accountId;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool withDate = false;
  bool isSearch = false;
  bool isLoading = false;
  String startTime = 'DD/MM/YYYY';
  String endTime = 'DD/MM/YYYY';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(),
      child: Scaffold(
        backgroundColor: const Color(0xffEEEDEB),
        appBar: AppBar(
          leading: Image.asset(AppImages.drawerIcon),
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
            var cubit = SplashCubit.get(context);
            return SingleChildScrollView(
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
                    name: accountDetailsModel?.status ?? 'نشط',
                    id: accountDetailsModel?.accountNumber ?? '27400000535107',
                    balance: accountDetailsModel?.outerBalance ?? '5.94',
                  ),
                  verticalSpacer(24),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              withDate = false;
                              setState(() {});
                            },
                            child: Container(
                              height: 32,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: withDate
                                      ? Colors.white
                                      : AppColors.secondary,
                                  border: Border(
                                    top: BorderSide(
                                        color: AppColors.borderColor),
                                    right: BorderSide(
                                        color: AppColors.borderColor),
                                    bottom: BorderSide(
                                        color: AppColors.borderColor),
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(8.r),
                                    bottomRight: Radius.circular(8.r),
                                  )),
                              child: Text(
                                'بالفترة',
                                style: AppTextStyles.textStyle14.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color:
                                        withDate ? Colors.black : Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              withDate = true;
                              setState(() {});
                            },
                            child: Container(
                              height: 32,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: withDate
                                      ? AppColors.secondary
                                      : Colors.white,
                                  border: Border(
                                    top: BorderSide(
                                        color: AppColors.borderColor),
                                    left: BorderSide(
                                        color: AppColors.borderColor),
                                    bottom: BorderSide(
                                        color: AppColors.borderColor),
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8.r),
                                    bottomLeft: Radius.circular(8.r),
                                  )),
                              child: Text(
                                'بالتاريخ',
                                style: AppTextStyles.textStyle14.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: withDate ? Colors.white : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  verticalSpacer(24),
                  TapBarChildItem(
                    withIcon: true,
                    haveBottomBorder: withDate ? true : false,
                    name: 'وقت التنفيذ',
                  ),
                  withDate
                      ? Container(
                          height: 56.h,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              vertical: 8.h, horizontal: 16.w),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                  bottom: BorderSide(
                                color: AppColors.color917F7F.withOpacity(.4),
                              ))),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  showDatePicker(context,
                                      onDateTimeChanged: (date) {
                                        final DateFormat formatter = DateFormat('yyyy-MM-dd');
                                        startTime = formatter.format(date);

                                    setState(() {});
                                  });
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'من',
                                      style: AppTextStyles.textStyle12.copyWith(
                                        color: AppColors.color514F4F,
                                      ),
                                    ),
                                    horizontalSpacer(56),
                                    Text(
                                      startTime,
                                      style: AppTextStyles.textStyle12.copyWith(
                                        color: AppColors.color917F7F,
                                      ),
                                    ),
                                    horizontalSpacer(15),
                                  ],
                                ),
                              ),
                              VerticalDivider(
                                color: AppColors.color917F7F,
                              ),
                              horizontalSpacer(20),
                              GestureDetector(
                                onTap: () {
                                  showDatePicker(context,
                                      onDateTimeChanged: (date) {
                                        final DateFormat formatter = DateFormat('yyyy-MM-dd');
                                        endTime = formatter.format(date);
                                    setState(() {});
                                  });
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'إلي',
                                      style: AppTextStyles.textStyle12.copyWith(
                                        color: AppColors.color514F4F,
                                      ),
                                    ),
                                    horizontalSpacer(48),
                                    Text(
                                      endTime,
                                      style: AppTextStyles.textStyle12.copyWith(
                                        color: AppColors.color917F7F,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      : const TapBarChildItem(
                          name: 'بالتاريخ*',
                        ),
                  Container(
                    height: 56.h,
                    alignment: Alignment.center,
                    padding:
                        EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            bottom: BorderSide(
                          color: AppColors.color917F7F.withOpacity(.4),
                        ))),
                    child: Row(
                      children: [
                        Text(
                          'من',
                          style: AppTextStyles.textStyle12.copyWith(
                            color: AppColors.color514F4F,
                          ),
                        ),
                        horizontalSpacer(16),
                        Text(
                          'المبلغ',
                          style: AppTextStyles.textStyle12.copyWith(
                            color: AppColors.color917F7F,
                          ),
                        ),
                        horizontalSpacer(104),
                        VerticalDivider(
                          color: AppColors.color917F7F,
                        ),
                        horizontalSpacer(15),
                        Text(
                          'إلي',
                          style: AppTextStyles.textStyle12.copyWith(
                            color: AppColors.color514F4F,
                          ),
                        ),
                        horizontalSpacer(16),
                        Text(
                          'المبلغ',
                          style: AppTextStyles.textStyle12.copyWith(
                            color: AppColors.color917F7F,
                          ),
                        ),
                      ],
                    ),
                  ),
                  verticalSpacer(32),
                  Center(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SvgPicture.asset(AppImages.tapBar),
                  )),
                  verticalSpacer(32),
                  Padding(
                    padding: EdgeInsets.only(right: 16.w, bottom: 16.h),
                    child: Text(
                      'نوع العمليه',
                      style: AppTextStyles.textStyle16
                          .copyWith(color: Colors.black),
                    ),
                  ),
                  const TapBarChildItem(
                    name: 'نوع العمليه',
                  ),
                  verticalSpacer(16),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: state is TransactionLoading
                        ? const Center(child: CupertinoActivityIndicator())
                        : CustomButton(
                            buttonName: 'بحث',
                            onTap: () {
                              isSearch = true;
                              if (startTime != 'DD/MM/YYYY' &&
                                  endTime != 'DD/MM/YYYY') {
                                cubit.getFilterTransaction(
                                    id: widget.accountId,
                                    startDate: startTime,
                                    endDate: endTime);
                              }
                            },
                          ),
                  ),
                  verticalSpacer(24),
                  if (isSearch && withDate) ...[
                    Padding(
                      padding: EdgeInsets.only(right: 16.w, bottom: 16.h,left: 16.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'أخر عمليات',
                            style: AppTextStyles.textStyle14
                                .copyWith(color: Colors.black),
                          ),
                          if(  cubit.filterTransactionModelApi?.data?.transactions
                              ?.isNotEmpty ==
                              true)
                          GestureDetector(
                            onTap: (){

                              goToWidget(screen: WebView());
                            },
                            child: Text(
                              'تصدير pdf',
                              style: AppTextStyles.textStyle14
                                  .copyWith(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                    cubit.filterTransactionModelApi?.data?.transactions
                                ?.isNotEmpty !=
                            true
                        ? SizedBox(
                            height: 100.h,
                            child: Center(
                              child: Text(
                                'لا يوجد عمليات في هذا التوقيت',
                                style: AppTextStyles.textStyle12
                                    .copyWith(color: AppColors.color514F4F),
                              ),
                            ),
                          )
                        : ListView.builder(
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) =>
                                LastTransactionsItem(
                                  transactionModel: cubit
                                      .filterTransactionModelApi
                                      ?.data
                                      ?.transactions?[index],
                                ),
                            itemCount: cubit.filterTransactionModelApi?.data
                                ?.transactions?.length)
                  ]
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

void showDatePicker(BuildContext context,
    {required void Function(DateTime) onDateTimeChanged}) {
  showModalBottomSheet(
    isDismissible: false,
    context: context,
    backgroundColor: Colors.white,
    shape: const LinearBorder(),
    builder: (BuildContext builder) {
      return SizedBox(
        height: 240,
        child: Column(
          children: [
            verticalSpacer(8),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      goBack();
                    },
                    child: Text(
                      'Done',
                      style: AppTextStyles.textStyle16.copyWith(
                        color: const Color(0xff777576),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      goBack();
                    },
                    child: Text(
                      'Cancel',
                      style: AppTextStyles.textStyle16.copyWith(
                        color: const Color(0xff777576),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Color(0xff777576),
            ),
            verticalSpacer(8),
            Expanded(
              child: Stack(
                children: [
                  CupertinoTheme(
                    data: CupertinoThemeData(
                      textTheme: CupertinoTextThemeData(
                          dateTimePickerTextStyle: AppTextStyles.textStyle16
                              .copyWith(color: const Color(0xff331616))),
                    ),
                    child: CupertinoDatePicker(
                      initialDateTime: DateTime.now(),
                      dateOrder: DatePickerDateOrder.ymd,
                      mode: CupertinoDatePickerMode.date,
                      onDateTimeChanged: onDateTimeChanged,
                    ),
                  ),
                  // Active Date Background (hover effect)

                  // Top Divider
                  // Positioned(
                  //   top: 68,
                  //   // Adjust to match the position of the top of active row
                  //   left: 60,
                  //   right: 60,
                  //   child: Container(
                  //     height: 1,
                  //     color: Colors.black, // Divider color
                  //   ),
                  // ),
                  // // Bottom Divider
                  // Positioned(
                  //   top: 96,
                  //   // Adjust to match the position of the bottom of active row
                  //   left: 60,
                  //   right: 60,
                  //   child: Container(
                  //     height: 1,
                  //     color: Colors.black, // Divider color
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
