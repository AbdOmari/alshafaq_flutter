part of 'addons_cubit.dart';

sealed class AddonsState extends Equatable {
  const AddonsState();

  @override
  List<Object?> get props => [];
}

final class AddonsInitial extends AddonsState {
  const AddonsInitial();
}

final class FetchAddonsSuccessState extends AddonsState {
  const FetchAddonsSuccessState();
}

final class AddonsFailureState extends AddonsState {
  final String? error;
  const AddonsFailureState(this.error);
  @override
  List<Object?> get props => [error];
}

final class AddonsLoadingState extends AddonsState {
  const AddonsLoadingState();
}
