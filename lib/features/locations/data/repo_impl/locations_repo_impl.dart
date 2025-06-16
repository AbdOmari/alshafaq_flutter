import 'package:ashafaq/config/network/tokens/impl/tokens_repo.dart';
import 'package:ashafaq/features/locations/data/models/m_location.dart';
import 'package:ashafaq/features/locations/data/services_impl/locations_service_impl.dart';
import 'package:ashafaq/features/locations/domain/entities/i_location.dart';
import 'package:ashafaq/features/locations/domain/i_repo/i_locations_repo.dart';

final class LocationsRepoImpl implements ILocationsRepo {
  final LocationsServiceImpl _locationsService;
  final TokensRepo _tokensRepo;
  String? _token;
  LocationsRepoImpl(this._locationsService, this._tokensRepo);

  Future _loadToken() async {
    _token = await _tokensRepo.fetchAccessToken();
  }

  @override
  Future<bool> addLocation(MLocation location) async {
    if (_token == null) await _loadToken();
    final result = await _locationsService.addLocation(_token!, location);
    if (result.isSucceed) return true;
    throw result.exceptions!;
  }

  @override
  Future<bool> deleteLocation(int id) async {
    if (_token == null) await _loadToken();
    final result = await _locationsService.deleteLocation(_token!, id);
    if (result.isSucceed) return true;
    throw result.exceptions!;
  }

  @override
  Future<List<ILocation>> getLocations() async {
    if (_token == null) await _loadToken();
    final result = await _locationsService.getLocations(_token!);
    if (result.isSucceed) return result.locations!;

    throw result.exceptions!;
  }

  @override
  Future<bool> updateLocation(int id, MLocation location) async {
    if (_token == null) await _loadToken();
    final result = await _locationsService.updateLocation(
      _token!,
      id,
      location,
    );
    if (result.isSucceed) return true;
    throw result.exceptions!;
  }
}
