import 'package:artificial_intelligence/core/presentation/widgets/responsive_space.dart';
import 'package:artificial_intelligence/core/routes/app_navigators.dart';
import 'package:artificial_intelligence/core/utils/app_images.dart';
import 'package:artificial_intelligence/core/utils/app_text_styles.dart';
import 'package:artificial_intelligence/features/account_summary/presentation/views/account_summary_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../features/layout/presentation/views/layout_screen.dart';
import '../../utils/app_colors.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: AppColors.secondary,
        shape: const LinearBorder(),
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          width: 349.w,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: Colors.black.withOpacity(.4),
                    padding:
                        EdgeInsets.symmetric(vertical: 20.h, horizontal: 12.w),
                    child: Column(
                      children: [
                        GestureDetector(
                            onTap: () {
                             goBack();
                            },
                            child: Image.asset(AppImages.drawerIcon)),
                        verticalSpacer(62),
                        Image.asset(AppImages.turnOff),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.asset(AppImages.snpLogo),
                        verticalSpacer(9),
                        Text(
                          'Welcome Back [AR] ',
                          style: AppTextStyles.textStyleLintel
                              .copyWith(color: Colors.white),
                        ),
                        verticalSpacer(8),
                        Text(
                          'necr328351 - 1010876749',
                          style: AppTextStyles.textStyle16,
                        ),
                        Text(
                          'Lasr login: 28/ 08/2024 [AR] ',
                          style: AppTextStyles.textStyle14.copyWith(
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: 70.h,
                alignment: Alignment.center,
                padding: EdgeInsets.all(12.r),
                color: const Color(0xffEEEDE9),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconWithText(icon:AppImages.clockIcon ,text:'في انتظار الموافقة' ,),
                    IconWithText(icon:AppImages.accountSettingIcon ,text:'الإعدادات' ,),
                    IconWithText(icon:AppImages.notificationIcon ,text:"الإشعارات" ,),
                    IconWithText(icon:AppImages.langIcon ,text:'الإنجليزية' ,),

                  ],
                ),
              ),
              verticalSpacer(24),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const DrawerItem(icon:AppImages.homeIcon ,title: 'الرئيسية',),
                      GestureDetector(
                        onTap: (){

                          goToWidget(screen: const AccountSummaryScreen());
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            verticalSpacer(15),
                            const DrawerItem(icon:AppImages.drawerIcon ,title: 'الملخص',),
                            verticalSpacer(15),
                          ],
                        ),
                      ),
                      const DrawerItem(icon:AppImages.accountPersonIcon ,title: 'الحسابات',),
                      verticalSpacer(15),
                      const DrawerItem(icon:AppImages.transferIcon ,title: 'التحويلات',),
                      verticalSpacer(15),
                      const DrawerItem(icon:AppImages.mailIcon ,title: 'سداد',),
                      verticalSpacer(15),
                      const DrawerItem(icon:AppImages.walletIcon ,title: 'بطاقات الشركات',),
                      verticalSpacer(15),
                      const DrawerItem(icon:AppImages.fireiCON ,title: 'أرامكو',),
                      verticalSpacer(15),
                      const DrawerItem(icon:AppImages.tradeIcon ,title: 'التجارة الإلكترونية',),
                    ],
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key, required this.icon, required this.title,
  });
final String icon,title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Image.asset(icon,height: 30,width: 30,),
            Text(title,style: AppTextStyles.textStyle14,),
          ],),
        ),
        verticalSpacer(10),
        const Divider(thickness: 1,color: Color(0xff706E6E),),
    
      ],
    );
  }
}

class IconWithText extends StatelessWidget {
  const IconWithText({
    super.key, required this.icon, required this.text,
  });
final String icon,text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(icon),
        verticalSpacer(3),
        Text(text,style: AppTextStyles.textStyle10.copyWith(
          color: const Color(0xff515151),

        ),),
      ],
    );
  }
}
