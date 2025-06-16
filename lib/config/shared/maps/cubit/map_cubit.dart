import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapCubit extends Cubit<MapLocation?> {
  MapCubit() : super(null);

  void chooseLocation(MapLocation? location) => emit(location);
}

final class MapLocation {
  final String name;
  final LatLng position;
  final String street;
  final String locality;
  final String country;
  final String administrativeArea;
  const MapLocation({
    required this.name,
    required this.position,
    required this.street,
    required this.locality,
    required this.administrativeArea,
    required this.country,
  });

  String? get locationAddress => '$street $locality';
  @override
  String toString() {
    return 'location: $position name: $name';
  }
}
