import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      this.prefixIcon,
      this.hintText,
      this.validator,
      this.currentFocusNode,
      this.nextFocusNode,
      this.hintStyle,
      this.controller,
      this.onFieldSubmitted, this.onChanged});
  final String? prefixIcon;
  final String? hintText;
  final String? Function(String?)? validator;
  final FocusNode? currentFocusNode, nextFocusNode;
  final TextEditingController? controller;
  final void Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final TextStyle? hintStyle;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 344.w,
      // height: 56.h,
      child: TextFormField(
        controller: controller,
        style: TextStyle(
          fontFamily: 'Lintel',
          fontSize: 18.sp,
          color: AppColors.color0C7D64,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.italic,
        ),
        validator: validator,
        onChanged: onChanged,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        cursorColor: AppColors.color0C7D64,
        textInputAction: currentFocusNode == nextFocusNode
            ? TextInputAction.done
            : TextInputAction.next,
            
        onFieldSubmitted: onFieldSubmitted ??
            (text) {
              if (currentFocusNode == nextFocusNode) {
                currentFocusNode?.unfocus();
              } else {
                currentFocusNode?.unfocus();
                FocusScope.of(context).requestFocus(nextFocusNode);
              }
            },
        focusNode: currentFocusNode,
        decoration: InputDecoration(
          hintText: hintText,
          errorMaxLines: 1,
          hintStyle: hintStyle ??
              TextStyle(
                fontSize: 18.sp,
                color: const Color(0XFF9FC8C0).withOpacity(.5),
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w400,
              ),
          prefixIcon: prefixIcon != null
              ? Padding(
                  padding: const EdgeInsets.all(12),
                  child: Image.asset(prefixIcon!),
                )
              : null,
          border: InputBorder.none,
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffE7DEDE))),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffE7DEDE))),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.red,
          )),
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffE7DEDE))),
          fillColor: const Color(0xffFCFEFD),
          filled: true,
        ),
      ),
    );
  }
}
