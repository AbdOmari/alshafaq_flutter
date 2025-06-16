part of 'single_wash_cubit.dart';

sealed class SingleWashState extends Equatable {
  const SingleWashState();

  @override
  List<Object> get props => [];
}

final class SingleWashInitialState extends SingleWashState {
  const SingleWashInitialState();
}

final class NoPackageState extends SingleWashState {
  const NoPackageState();
}

final class SingleWashLoadingState extends SingleWashState {
  const SingleWashLoadingState();
}

final class GotSingleWashState extends SingleWashState {
  final SinglePackage package;
  const GotSingleWashState(this.package);
  @override
  List<Object> get props => [package];
}

final class SingleWashFailureState extends SingleWashState {
  final String error;
  const SingleWashFailureState(this.error);
  @override
  List<Object> get props => [error];
}
