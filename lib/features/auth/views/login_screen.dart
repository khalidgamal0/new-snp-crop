import 'package:artificial_intelligence/core/routes/app_navigators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/presentation/widgets/custom_button.dart';
import '../../../core/presentation/widgets/custom_text_form_field.dart';
import '../../../core/presentation/widgets/responsive_space.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_images.dart';
import '../../../core/utils/app_text_styles.dart';
import '../../layout/presentation/views/layout_screen.dart';
import 'login_cubit.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget with LoginCubit {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.zero,
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.loginBackground),
            fit: BoxFit.cover,
          ),
        ),
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
                    return null;
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
                    return null;
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
                    return null;
                  },
                ),
                verticalSpacer(12),
                CustomButton(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      buildShowDialog(context);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Image.asset(AppImages.loginBottomNav,fit: BoxFit.cover,),
    );
  }

}
