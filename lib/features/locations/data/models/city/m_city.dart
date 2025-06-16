import 'package:ashafaq/features/locations/domain/entities/i_city.dart';
import 'package:json_annotation/json_annotation.dart';
part 'm_city.g.dart';

@JsonSerializable()
final class MCity extends ICity {
  const MCity(super.id, super.name);

  factory MCity.fromJson(Map<String, dynamic> json) => _$MCityFromJson(json);

  static List<MCity> fromJsonList(List json) =>
      json.map((item) {
        return MCity.fromJson(item);
      }).toList();
}
