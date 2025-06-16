import 'package:ashafaq/config/helpers/dio_helper.dart';
import 'package:ashafaq/core/request/endpoints.dart';
import 'package:ashafaq/features/locations/data/models/m_location.dart';
import 'package:ashafaq/features/locations/data/responses/locations_response.dart';
import 'package:ashafaq/features/locations/domain/i_services/i_locations_service.dart';

final class LocationsServiceImpl implements ILocationsService {
  final DioHelper _dioHelper;
  const LocationsServiceImpl(this._dioHelper);
  @override
  Future<AddressesResponse> addLocation(
    String token,
    MLocation location,
  ) async {
    final response = await _dioHelper.post(
      LocationsUrls.addresses,
      headers: _dioHelper.requestHeaders.getHeaders(token),
      body: location.toJson(),
    );
    return AddressesResponse.init(response);
  }

  @override
  Future<AddressesResponse> deleteLocation(String token, int id) async {
    final response = await _dioHelper.delete(
      '${LocationsUrls.addresses}/$id',
      headers: _dioHelper.requestHeaders.getHeaders(token),
    );
    return AddressesResponse.init(response);
  }

  @override
  Future<AddressesResponse> getLocations(String token) async {
    final response = await _dioHelper.get(
      LocationsUrls.addresses,
      headers: _dioHelper.requestHeaders.getHeaders(token),
    );
    return AddressesResponse.init(response);
  }

  @override
  Future<AddressesResponse> updateLocation(
    String token,
    int id,
    MLocation location,
  ) async {
    final response = await _dioHelper.patch(
      '${LocationsUrls.addresses}/$id',
      headers: _dioHelper.requestHeaders.getHeaders(token),
      body: location.toJson(),
    );
    return AddressesResponse.init(response);
  }
}
