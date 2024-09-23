import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../loading_cubit/loading_cubit.dart';
import 'loader_item.dart';

class Loader extends StatelessWidget {
  final Loading loading;
  final Widget? loader;
  const Loader({super.key, required this.loading, this.loader});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Loading, LoadingState>(
      bloc: loading,
      builder: (context, state) {
        if (state is LoadingChange) {
          return state.loading!
              ? WillPopScope(
                  child: loader == null ? const LoaderItem() : loader!,
                  onWillPop: () async {
                    loading.hide;
                    return true;
                  },
                )
              : Container();
        } else {
          return Container();
        }
      },
    );
  }
}
