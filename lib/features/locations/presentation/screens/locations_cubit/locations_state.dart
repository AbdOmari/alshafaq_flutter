part of 'locations_cubit.dart';

sealed class LocationsState extends Equatable {
  const LocationsState();

  @override
  List<Object> get props => [];
}

final class LocationsInitial extends LocationsState {
  const LocationsInitial();
}

final class LocationsLoadingState extends LocationsState {
  const LocationsLoadingState();
}

final class NoLocationsState extends LocationsState {
  const NoLocationsState();
}

final class LocationsNoInternetState extends LocationsState {
  const LocationsNoInternetState();
}

final class AddedLocationState extends LocationsState {
  const AddedLocationState();
}

final class DeletedLocationState extends LocationsState {
  const DeletedLocationState();
}

final class UpdatedLocationState extends LocationsState {
  const UpdatedLocationState();
}

final class GotLocationsState extends LocationsState {
  final List<ILocation> locations;
  const GotLocationsState(this.locations);
  @override
  List<Object> get props => [locations];
}

final class LocationsErrorState extends LocationsState {
  final String error;
  const LocationsErrorState(this.error);
  @override
  List<Object> get props => [error];
}
