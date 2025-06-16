part of 'banners_cubit.dart';

sealed class BannersState extends Equatable {
  const BannersState();

  @override
  List<Object> get props => [];
}

final class BannersInitialState extends BannersState {
  const BannersInitialState();
}

final class BannersLoadingState extends BannersState {
  const BannersLoadingState();
}


final class NoBannersState extends BannersState {
  const NoBannersState();
}

final class BannersFailureState extends BannersState {
  final String error;
  const BannersFailureState(this.error);
  @override
  List<Object> get props => [error];
}

final class GotBannersState extends BannersState {
  final List<IBanner> banners;
  const GotBannersState(this.banners);
  @override
  List<Object> get props => [banners];
}
