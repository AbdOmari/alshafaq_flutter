part of 'all_packages_cubit.dart';

sealed class AllPackagesState extends Equatable {
  const AllPackagesState();

  @override
  List<Object> get props => [];
}

final class AllPackagesInitialState extends AllPackagesState {
  const AllPackagesInitialState();
}

final class AllPackagesLoadingState extends AllPackagesState {
  const AllPackagesLoadingState();
}

final class NoPackagesState extends AllPackagesState {
  const NoPackagesState();
}

final class GotAllPackagesState extends AllPackagesState {
  final List<Package> packages;
  const GotAllPackagesState(this.packages);
  @override
  List<Object> get props => [packages];
}

final class AllPackagesFailureState extends AllPackagesState {
  final String error;
  const AllPackagesFailureState(this.error);
  @override
  List<Object> get props => [error];
}
