import 'package:ashafaq/features/locations/data/models/m_location.dart';

abstract class ILocationsRepo {
  getLocations();
  addLocation(MLocation location);
  updateLocation(int id, MLocation location);
  deleteLocation(int id);
}
