import 'package:ashafaq/features/request/domain/entities/order_extra.dart';

import 'package:json_annotation/json_annotation.dart';

part 'm_order_extra.g.dart';

@JsonSerializable()
final class MOrderExtra extends OrderExtra {
  const MOrderExtra({
    required super.id,
    required super.name,
    required super.price,
    required super.image,
  });

  factory MOrderExtra.fromJson(Map<String, dynamic> json) =>
      _$MOrderExtraFromJson(json);

  static List<OrderExtra> toEntity(List json) =>
      json.map((item) {
        return MOrderExtra.fromJson(item); //Now we have it as model
      }).toList();
}
