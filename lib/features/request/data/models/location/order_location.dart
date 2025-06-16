import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final class OrderLocation extends Equatable {
  final LatLng location;
  final String name;
  const OrderLocation(this.location, this.name);
  @override
  List<Object?> get props => [name, location];

  @override
  String toString() {    
    return 'location: $location name: $name';
  }
}
