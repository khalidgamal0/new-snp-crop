import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../generic_cubit/generic_cubit.dart';

class GenericBuilder<T> extends StatefulWidget {
  ///[genericCubit]The Generic Cubit instance
  final GenericCubit<T> genericCubit;
  final Widget Function(T) builder;
  final Function? listner;
  const GenericBuilder(
      {super.key,
      required this.builder,
      required this.genericCubit,
      this.listner});

  @override
  _GenericBuilderState<T> createState() => _GenericBuilderState<T>();
}

class _GenericBuilderState<T> extends State<GenericBuilder<T>> {
  @override
  Widget build(BuildContext context) {
    //TODO check correct
    return BlocConsumer<GenericCubit<T>, GenericState<T>>(
      bloc: widget.genericCubit,
      listener: widget.listner != null
          ? (context, state) {
              if (state is GenericUpdate) {
                widget.listner!();
              }
            }
          : (context, state) {},
      builder: (context, state) {
        if (state is GenericUpdate) {
          return widget.builder(state.data as T);
        } 
        // else if(data!=null){}
        else {
          return Container();
        }
      },
    );
  }
}
