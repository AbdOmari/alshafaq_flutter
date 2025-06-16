import 'package:ashafaq/features/locations/domain/entities/i_coordinate.dart';

class ICoordinates {
  final String type;
  final List<ICoordinate> iCoordinate;
  const ICoordinates(this.type, this.iCoordinate);
}
