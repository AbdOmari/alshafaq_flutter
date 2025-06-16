import 'package:ashafaq/features/locations/domain/entities/i_coordinates.dart';
import 'package:equatable/equatable.dart';

class IZone extends Equatable {
  final int id;
  final String name;
  final ICoordinates iCoordinates;
  const IZone(this.id, this.name, this.iCoordinates);
  @override
  List<Object?> get props => [id, name, iCoordinates];
}
