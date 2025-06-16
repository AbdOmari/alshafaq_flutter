import 'package:ashafaq/features/locations/data/models/zones/m_zone.dart';
import 'package:equatable/equatable.dart';

class ILocation extends Equatable {
  final int id;
  final String name;
  final String? notes;
  final String latitude;
  final String longitude;
  final MZone zone;
  const ILocation({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.zone,
    this.notes,
  });

  @override
  List<Object?> get props => [id, name, latitude, longitude, zone, notes];
}
