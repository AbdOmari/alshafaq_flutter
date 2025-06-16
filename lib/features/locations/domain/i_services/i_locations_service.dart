import 'package:ashafaq/features/locations/data/models/m_location.dart';

abstract class ILocationsService {
  Future getLocations(String token);
  Future addLocation(String token, MLocation location);
  Future updateLocation(String token, int id, MLocation location);
  Future deleteLocation(String token, int id);
}
