import 'package:ashafaq/config/helpers/dio_helper.dart';
import 'package:ashafaq/core/request/endpoints.dart';
import 'package:ashafaq/features/locations/data/responses/cities_response.dart';
import 'package:ashafaq/features/locations/data/responses/zones_response.dart';
import 'package:ashafaq/features/locations/domain/i_services/i_zones_service.dart';

final class ZonesServiceImpl implements IZonesService {
  final DioHelper _dioHelper;
  const ZonesServiceImpl(this._dioHelper);
  @override
  Future<ZonesResponse> getZones(String token) async {
    final response = await _dioHelper.get(
      LocationsUrls.zones,
      headers: _dioHelper.requestHeaders.getHeaders(token),
    );
    return ZonesResponse.init(response);
  }

  @override
  Future<CitiesResponse> getCities(String token) async {
    final response = await _dioHelper.get(
      LocationsUrls.cities,
      headers: _dioHelper.requestHeaders.getHeaders(token),
    );
    return CitiesResponse.init(response);
  }
}
