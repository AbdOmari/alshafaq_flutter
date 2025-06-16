part of 'zones_cubit.dart';

sealed class ZonesState extends Equatable {
  const ZonesState();

  @override
  List<Object> get props => [];
}

final class ZonesInitial extends ZonesState {
  const ZonesInitial();
}

final class ZonesLoadingState extends ZonesState {
  const ZonesLoadingState();
}

final class ZonesErrorState extends ZonesState {
  final String error;
  const ZonesErrorState(this.error);
  @override
  List<Object> get props => [error];
}

final class GotZonesState extends ZonesState {
  final List<IZone> zones;
  const GotZonesState(this.zones);
  @override
  List<Object> get props => [zones];
}

final class GotCitiesState extends ZonesState {
  final List<ICity> cities;
  const GotCitiesState(this.cities);
  @override
  List<Object> get props => [cities];
}
