import 'package:ashafaq/features/locations/data/models/zones/m_zone.dart';
import 'package:ashafaq/features/locations/domain/entities/i_location.dart';
import 'package:json_annotation/json_annotation.dart';
part 'm_location.g.dart';

@JsonSerializable()
final class MLocation extends ILocation {
  const MLocation({
    required super.id,
    required super.name,
    required super.latitude,
    required super.longitude,
    required super.zone,
    super.notes,
  });

  factory MLocation.fromJson(Map<String, dynamic> json) =>
      _$MLocationFromJson(json);

  Map<String, dynamic> toJson() => _$MLocationToJson(this);

  static List<ILocation> fromJsonList(List json) =>
      json.map((item) {
        return MLocation.fromJson(item);
      }).toList();
}
