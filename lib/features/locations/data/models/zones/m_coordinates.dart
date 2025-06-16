import 'package:ashafaq/features/locations/data/models/zones/m_coordinate.dart';
import 'package:ashafaq/features/locations/domain/entities/i_coordinates.dart';
import 'package:json_annotation/json_annotation.dart';

part 'm_coordinates.g.dart';

@JsonSerializable()
final class MCoordinates extends ICoordinates {
  const MCoordinates(super.type, super.iCoordinate);

  factory MCoordinates.fromJson(Map<String, dynamic> json) =>
      _$MCoordinatesFromJson(json);
}
