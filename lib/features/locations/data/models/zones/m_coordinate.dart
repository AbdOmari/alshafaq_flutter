import 'package:ashafaq/features/locations/domain/entities/i_coordinate.dart';
import 'package:json_annotation/json_annotation.dart';

part 'm_coordinate.g.dart';

@JsonSerializable()
final class MCoordinate extends ICoordinate {
  const MCoordinate(super.lat, super.lng);

  factory MCoordinate.fromJson(Map<String, dynamic> json) =>
      _$MCoordinateFromJson(json);

  static List<ICoordinate> fromJsonList(List json) =>
      json.map((item) {
        return MCoordinate.fromJson(item);
      }).toList();
}
