import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'new_loading_state.dart';

class NewLoading extends Cubit<NewLoadingState> {
  NewLoading() : super(TestLoadingInitial());
  void show() {
    log("show function called");

    if (State is! ShowLoading) {
      emit(ShowLoading());
      log("show function executed");
    }
  }

  void hide() {
    log("hide function called");
    if (State is! HideLoading) {
      emit(HideLoading());
      log("hide function executed");
    }
  }
}
