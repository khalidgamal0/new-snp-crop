import 'package:flutter/material.dart';

mixin LoginCubit {
   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
   final GlobalKey<FormState> verivicationFormKey = GlobalKey<FormState>();
   TextEditingController verivicationController=TextEditingController();
  FocusNode corporateFocus = FocusNode();
  FocusNode userFocus = FocusNode();
  FocusNode passFocus = FocusNode();
}