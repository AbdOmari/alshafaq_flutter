import 'package:ashafaq/config/exceptions/base_exception.dart';
import 'package:ashafaq/config/exceptions/network_exception.dart';
import 'package:ashafaq/features/locations/data/models/m_location.dart';
import 'package:ashafaq/features/locations/data/repo_impl/locations_repo_impl.dart';
import 'package:ashafaq/features/locations/domain/entities/i_location.dart';
import 'package:ashafaq/features/locations/domain/i_repo/i_locations_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'locations_state.dart';

class LocationsCubit extends Cubit<LocationsState> implements ILocationsRepo {
  final LocationsRepoImpl _locationsRepoImpl;
  LocationsCubit(this._locationsRepoImpl) : super(const LocationsInitial());

  @override
  void addLocation(MLocation location) async {
    emit(const LocationsLoadingState());
    try {
      await _locationsRepoImpl.addLocation(location);
      emit(const AddedLocationState());
    } on BaseException catch (e) {
      emit(LocationsErrorState(e.message!));
    } catch (e) {
      emit(LocationsErrorState(e.toString()));
    }
  }

  @override
  void deleteLocation(int id) async {
    emit(const LocationsLoadingState());
    try {
      await _locationsRepoImpl.deleteLocation(id);
      emit(const DeletedLocationState());
    } on BaseException catch (e) {
      emit(LocationsErrorState(e.message!));
    } catch (e) {
      emit(LocationsErrorState(e.toString()));
    }
  }

  @override
  void getLocations() async {
    emit(const LocationsLoadingState());
    try {
      final locations = await _locationsRepoImpl.getLocations();
      if (locations.isEmpty) {
        emit(const NoLocationsState());
        return;
      }
      emit(GotLocationsState(locations));
    } on BaseException catch (e) {
      emit(LocationsErrorState(e.message!));
    } on NetworkException catch (e) {
      if (e.exceptionType == NetworkExceptionType.noInternet) {
        emit(const LocationsNoInternetState());
      }
    } catch (e) {
      emit(LocationsErrorState(e.toString()));
    }
  }

  @override
  void updateLocation(int id, MLocation location) async {
    emit(const LocationsLoadingState());
    try {
      await _locationsRepoImpl.updateLocation(id, location);
      emit(const UpdatedLocationState());
    } on BaseException catch (e) {
      emit(LocationsErrorState(e.message!));
    } catch (e) {
      emit(LocationsErrorState(e.toString()));
    }
  }
}
