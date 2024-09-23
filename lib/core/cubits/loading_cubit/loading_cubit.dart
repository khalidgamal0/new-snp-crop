import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

part 'loading_state.dart';

class Loading extends Cubit<LoadingState> {
  Loading() : super(const LoadingInitial());

  // onChangeLoading() {
  //   emit(LoadingChange(!state.change, !state.loading));
  // }

  get hide {
    emit(LoadingChange(!state.change!, false));
  }

  get show {
    FocusScope.of(Get.context!).unfocus();
    emit(LoadingChange(!state.change!, true));
  }
}
