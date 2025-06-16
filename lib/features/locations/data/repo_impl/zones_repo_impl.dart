import 'package:ashafaq/config/network/tokens/impl/tokens_repo.dart';
import 'package:ashafaq/features/locations/data/services_impl/zones_service_impl.dart';
import 'package:ashafaq/features/locations/domain/entities/i_city.dart';
import 'package:ashafaq/features/locations/domain/entities/i_zone.dart';
import 'package:ashafaq/features/locations/domain/i_repo/i_zones_repo.dart';

final class ZonesRepoImpl implements IZonesRepo {
  final ZonesServiceImpl _zonesService;
  final TokensRepo _tokensRepo;
   String? _token;
  ZonesRepoImpl(this._zonesService, this._tokensRepo);
  Future _loadToken() async {
    _token = await _tokensRepo.fetchAccessToken();
  }

  @override
  Future<List<IZone>> getZones() async {
    if (_token == null) await _loadToken();
    final result = await _zonesService.getZones(_token!);
    if (result.isSucceed) return result.zones;
    throw result.exceptions!;
  }

  @override
  Future<List<ICity>> getCities() async {
    if (_token == null) await _loadToken();
    final result = await _zonesService.getCities(_token!);
    if (result.isSucceed) return result.cities;
    throw result.exceptions!;
  }
}
