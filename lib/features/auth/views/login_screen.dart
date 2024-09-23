import 'dart:developer';

import 'package:artificial_intelligence/core/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/presentation/widgets/responsive_space.dart';
import '../../../core/utils/app_images.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                    // mainAxisSize: MainAxisSize.max,
                    children: [
                      verticalSpacer(130),
                      Image.asset(AppImages.logo),
                      verticalSpacer(62),
                       CustomTextFormField(
                        hintText:'',
                        validator: (val){
                          if(val!.isEmpty){
                            return 'مطلوب';
                          }
                        },
                        suffixIcon: AppImages.corporateIcon,
                      ),
                      verticalSpacer(12),
                       CustomTextFormField(
                        suffixIcon: AppImages.userIcon,
                        validator: (val){
                          if(val!.isEmpty){
                            return 'مطلوب';
                          }
                        },
                      ),
                      verticalSpacer(12),
                       CustomTextFormField(
                        suffixIcon: AppImages.lockIcon,
                        validator: (val){
                          if(val!.isEmpty){
                            return 'مطلوب';
                          }
                        },
                      ),
                      verticalSpacer(12),
                       CustomButton(onTap: (){
                        if(formKey.currentState!.validate()){
                          log('doneeeeeeeeeeeee');
                        }
                      },),
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

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, this.onTap,
  });
final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 344.w,
        height: 56.h,
        decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(4.r)),
        child: Text(
          'التالي',
          style: TextStyle(
              fontFamily: 'Typography',
              fontSize: 22.sp,
              color: Colors.white,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key, this.suffixIcon, this.hintText,this.validator
  });
  final String?suffixIcon;
  final String?hintText;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 344.w,
      height: 56.h,
      child: TextFormField(
validator: validator,
        decoration:  InputDecoration(
          hintText:hintText,
          suffixIcon:suffixIcon!=null?SvgPicture.asset(suffixIcon!):null,
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffE7DEDE))),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffE7DEDE))),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffE7DEDE))),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red,)),
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color:Color(0xffE7DEDE))),
          fillColor: const Color(0xffFCFEFD),
          filled: true,
        ),
      ),
    );
  }
}
