part of 'saving_packages_cubit.dart';

sealed class SavingPackagesState extends Equatable {
  const SavingPackagesState();

  @override
  List<Object> get props => [];
}

final class SavingPackagesInitialState extends SavingPackagesState {
  const SavingPackagesInitialState();
}
final class NoPackagesState extends SavingPackagesState {
  const NoPackagesState();
}

final class SavingPackagesLoadingState extends SavingPackagesState {
  const SavingPackagesLoadingState();
}

final class GotSavingPackagesState extends SavingPackagesState {
  final List<SavingPackage> packages;
  const GotSavingPackagesState(this.packages);
  @override
  List<Object> get props => [packages];
}

final class SavingPackagesFailureState extends SavingPackagesState {
  final String error;
  const SavingPackagesFailureState(this.error);
  @override
  List<Object> get props => [error];
}
