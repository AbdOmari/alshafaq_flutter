import 'package:ashafaq/config/exceptions/base_exception.dart';
import 'package:ashafaq/features/locations/data/repo_impl/zones_repo_impl.dart';
import 'package:ashafaq/features/locations/domain/entities/i_city.dart';
import 'package:ashafaq/features/locations/domain/entities/i_zone.dart';
import 'package:ashafaq/features/locations/domain/i_repo/i_zones_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'zones_state.dart';

class ZonesCubit extends Cubit<ZonesState> implements IZonesRepo {
  final ZonesRepoImpl _zonesRepoImpl;

  ZonesCubit(this._zonesRepoImpl) : super(const ZonesInitial());
  @override
  void getZones() async {
    emit(const ZonesLoadingState());
    try {
      final zones = await _zonesRepoImpl.getZones();
      emit(GotZonesState(zones));
    } on BaseException catch (e) {
      emit(ZonesErrorState(e.message!));
    } catch (e) {
      emit(ZonesErrorState(e.toString()));
    }
  }

  @override
  void getCities() async {
    emit(const ZonesLoadingState());
    try {
      final cities = await _zonesRepoImpl.getCities();
      emit(GotCitiesState(cities));
    } on BaseException catch (e) {
      emit(ZonesErrorState(e.message!));
    } catch (e) {
      emit(ZonesErrorState(e.toString()));
    }
  }
}
