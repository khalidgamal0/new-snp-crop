import 'dart:developer';
import 'package:artificial_intelligence/core/utils/app_colors.dart';
import 'package:artificial_intelligence/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/presentation/widgets/custom_button.dart';
import '../../../core/presentation/widgets/custom_text_form_field.dart';
import '../../../core/presentation/widgets/responsive_space.dart';
import '../../../core/utils/app_images.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FocusNode corporateFocus = FocusNode();
  FocusNode userFocus = FocusNode();
  FocusNode passFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.zero,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.loginBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      verticalSpacer(40),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: 30.w),
                          child: Text(
                            'English',
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      verticalSpacer(77),
                      Image.asset(AppImages.logo),
                      verticalSpacer(62),
                      CustomTextFormField(
                        currentFocusNode: corporateFocus,
                        nextFocusNode: userFocus,
                        hintText: 'Corporate ID [AR] ',
                        prefixIcon: AppImages.corporateIcon,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'مطلوب';
                          }
                        },
                      ),
                      verticalSpacer(12),
                      CustomTextFormField(
                        currentFocusNode: userFocus,
                        nextFocusNode: passFocus,
                        prefixIcon: AppImages.userIcon,
                        hintText: 'User ID [AR] ',
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'مطلوب';
                          }
                        },
                      ),
                      verticalSpacer(12),
                      CustomTextFormField(
                        currentFocusNode: passFocus,
                        nextFocusNode: passFocus,
                        prefixIcon: AppImages.lockIcon,
                        hintText: 'Password ID [AR] ',
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'مطلوب';
                          }
                        },
                      ),
                      verticalSpacer(12),
                      CustomButton(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            showDialog(
                              context: context,
                              builder: (context) => Container(
                                color: Colors.white,
                                width: 343.w,
                                height: 346.h,
                                padding: EdgeInsets.only(
                                  top: 32.h,
                                  right: 31.w,
                                  left: 32.w,
                                  bottom: 16.h,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'تعميد الدخول',
                                      style: AppTextStyles.textStyle14
                                          .copyWith(color: Colors.black),
                                    ),
                                    verticalSpacer(17),
                                    CustomButton(
                                      width: 279,
                                      height: 40,
                                      style: AppTextStyles.textStyle14,
                                      buttonName: 'رسالة قصيرة',
                                      color: AppColors.secondary,
                                    ),
                                    verticalSpacer(24),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '053****347',
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.grey),
                                        ),
                                        horizontalSpacer(20),
                                        Text(
                                          'Please wait 28 seconds[AR]\n'
                                          ' before requesting another SMS\n'
                                          ' code',
                                          textAlign: TextAlign.start,
                                          style: AppTextStyles.textStyle12
                                              .copyWith(color: AppColors.grey),
                                        )
                                      ],
                                    ),
                                    verticalSpacer(16),
                                    Text(
                                      'Note: If you wish to update your mobile [AR]\n'
                                      'number kindly visit your nearest AlAhibranch',
                                      style: AppTextStyles.textStyle14
                                          .copyWith(color: Colors.black),
                                    ),
                                    verticalSpacer(16),
                                    // CustomTextFormField(),
                                  ],
                                ),
                              ),
                            );
                            log('doneeeeeeeeeeeee');
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Image.asset(AppImages.loginBottomNav),
          ],
        ),
      ),
    );
  }
}
