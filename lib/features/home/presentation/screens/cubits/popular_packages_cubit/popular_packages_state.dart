part of 'popular_packages_cubit.dart';

sealed class PopularPackagesState extends Equatable {
  const PopularPackagesState();

  @override
  List<Object> get props => [];
}

final class PopularPackageInitialState extends PopularPackagesState {
  const PopularPackageInitialState();
}

final class NoPackagesState extends PopularPackagesState {
  const NoPackagesState();
}

final class PopularPackageLoadingState extends PopularPackagesState {
  const PopularPackageLoadingState();
}

final class NoInterNetConnectionState extends PopularPackagesState {
  const NoInterNetConnectionState();
}

final class ServerErrorState extends PopularPackagesState {
  const ServerErrorState();
}

final class GotPopularPackageState extends PopularPackagesState {
  final List<NormalPackage> packages;
  const GotPopularPackageState(this.packages);
  @override
  List<Object> get props => [packages];
}

final class PopularPackageFailureState extends PopularPackagesState {
  final String error;
  const PopularPackageFailureState(this.error);
  @override
  List<Object> get props => [error];
}
