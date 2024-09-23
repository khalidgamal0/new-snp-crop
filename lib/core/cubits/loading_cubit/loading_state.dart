part of 'loading_cubit.dart';

abstract class LoadingState extends Equatable {
  final bool? loading;
  final bool? change;
  const LoadingState({
    this.change,
    this.loading,
  });
}

class LoadingInitial extends LoadingState {
  const LoadingInitial() : super(loading: false, change: false);
  @override
  List<Object?> get props => [loading, change];
}

class LoadingChange extends LoadingState {
  const LoadingChange(bool change, bool loading)
      : super(change: change, loading: loading);
  @override
  List<Object?> get props => [loading, change];
}
