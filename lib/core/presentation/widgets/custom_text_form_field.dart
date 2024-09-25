import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key, this.prefixIcon, this.hintText,this.validator, this.currentFocusNode, this.nextFocusNode
  });
  final String?prefixIcon;
  final String?hintText;
  final String? Function(String?)? validator;
  final FocusNode? currentFocusNode, nextFocusNode;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 344.w,
      // height: 56.h,
      child: TextFormField(
        style: TextStyle(
            fontSize: 18.sp,
            color: AppColors.color0C7D64,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            ),
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        cursorColor: AppColors.color0C7D64,
        textInputAction: currentFocusNode == nextFocusNode
            ? TextInputAction.done
            : TextInputAction.next,
        onFieldSubmitted: (text) {
          if (currentFocusNode == nextFocusNode) {
            currentFocusNode?.unfocus();
          } else {
            currentFocusNode?.unfocus();
            FocusScope.of(context).requestFocus(nextFocusNode);
          }
        },
        focusNode: currentFocusNode,

        decoration:  InputDecoration(

          hintText:hintText,
          errorMaxLines: 1,
          hintStyle: TextStyle(fontSize: 18.sp,color: const Color(0XFF9FC8C0).withOpacity(.5),fontStyle:FontStyle.italic ),
          prefixIcon:prefixIcon!=null?Padding(
            padding: const EdgeInsets.all(12),
            child: Image.asset(prefixIcon!),
          ):null,
          border: InputBorder.none,

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
