import 'package:ashafaq/features/locations/data/models/zones/m_coordinates.dart';
import 'package:ashafaq/features/locations/domain/entities/i_zone.dart';
import 'package:json_annotation/json_annotation.dart';
part 'm_zone.g.dart';

@JsonSerializable()
final class MZone extends IZone {
  const MZone(super.id, super.name, super.iCoordinates);

  factory MZone.fromJson(Map<String, dynamic> json) => _$MZoneFromJson(json);

  Map<String, dynamic> toJson() => _$MZoneToJson(this);

  static List<IZone> fromJsonList(List json) =>
      json.map((item) {
        return MZone.fromJson(item);
      }).toList();
}
