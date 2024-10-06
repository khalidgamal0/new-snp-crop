import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/presentation/widgets/custom_button.dart';
import '../../../core/presentation/widgets/custom_text_form_field.dart';
import '../../../core/presentation/widgets/responsive_space.dart';
import '../../../core/routes/app_navigators.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_images.dart';
import '../../../core/utils/app_text_styles.dart';
import '../../layout/presentation/views/layout_screen.dart';
import '../../splash/cubit/splash_cubit.dart';

mixin LoginCubit {
   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
   final GlobalKey<FormState> verificationFormKey = GlobalKey<FormState>();
   TextEditingController verificationController=TextEditingController();
  FocusNode corporateFocus = FocusNode();
  FocusNode userFocus = FocusNode();
  FocusNode passFocus = FocusNode();

   Future<dynamic> buildShowDialog(BuildContext context) {
     return showDialog(
       barrierDismissible: false,
       context: context,
       builder: (context) => AlertDialog(

         contentPadding: EdgeInsets.zero,
         content: Container(
           width: double.infinity,
           height: 385.h,
           padding: EdgeInsets.only(
             top: 32.h,
             right: 8.w,
             left: 8.w,
             bottom: 16.h,
           ),
           color: const Color(0XffFEFEFE),
           child: Form(
             key: verificationFormKey,
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(
                   'تعميد الدخول',
                   style: AppTextStyles.textStyle14.copyWith(
                       color: const Color(0XFF151010)),
                 ),
                 verticalSpacer(16),
                 CustomButton(
                   width: 279,
                   height: 40,
                   style: AppTextStyles.textStyle14,
                   buttonName: 'تأكيد',
                   onTap: (){
                     goToWidget(
                         screen: const LayoutScreen());
                   },
                   color: AppColors.secondary,
                 ),
                 verticalSpacer(24),
                 Row(
                   crossAxisAlignment:
                   CrossAxisAlignment.start,
                   children: [
                     Expanded(
                       child: Text(
                         accountSetting?.verifyPhone??'053****347',
                         textDirection: TextDirection.ltr,
                         textAlign: TextAlign.end,
                         style: TextStyle(
                           overflow: TextOverflow.ellipsis,
                             fontSize: 17.sp,
                             fontWeight: FontWeight.w500,
                             color: AppColors.grey),
                       ),
                     ),
                     horizontalSpacer(8),
                     Text(
                       'يرجى الانتظار 28 ثانية قبل \nطلب رسالة نصية قصيرة أخرى',
                       textAlign: TextAlign.start,
                       style: AppTextStyles.textStyle12
                           .copyWith(color: AppColors.grey),
                     )
                   ],
                 ),
                 verticalSpacer(16),
                 Align(
                   alignment: Alignment.centerLeft,
                   child: Text(
                     'ملاحظة: إذا كنت ترغب في تحديث رقم هاتفك\n المحمول، يرجى زيارة أقرب فرع للبنك',
                     style: AppTextStyles.textStyleLintel,
                   ),
                 ),
                 verticalSpacer(16),
                 CustomTextFormField(
                   prefixIcon: AppImages.verificationCoder,
                   controller: verificationController,
                   textInputType: TextInputType.phone,
                   hintText:
                   '                  ادخل رمز التفعيل',
                   hintStyle: AppTextStyles.textStyle14
                       .copyWith(
                       color: const Color(0xffC4A6A6),
                       fontSize: 14.sp,
                       fontWeight: FontWeight.w500),
                   onChanged: (val) {},
                   onFieldSubmitted: (val) {
                     if (verificationFormKey.currentState!
                         .validate()) {
                       goToWidget(
                           screen: const LayoutScreen());
                     }
                   },
                 ),
                 verticalSpacer(16),
                 Center(
                   child: Text(
                     verificationController.text.isEmpty
                         ? 'إعاده إرسال'
                         : '',
                     style: AppTextStyles.textStyle14.copyWith(
                         color: AppColors.color0C7D64),
                   ),
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     ...List.generate(
                       20,
                           (index) => Container(
                         margin: EdgeInsets.all(1.r),
                         width: 2.w,
                         height: 2.h,
                         color: Colors.black,
                       ),
                     )
                   ],
                 )
               ],
             ),
           ),
         ),
       ),
     );
   }

}