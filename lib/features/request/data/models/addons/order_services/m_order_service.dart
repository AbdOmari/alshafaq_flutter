import 'package:ashafaq/features/request/domain/entities/order_service.dart';
import 'package:json_annotation/json_annotation.dart';
part 'm_order_service.g.dart';

@JsonSerializable()
final class MOrderService extends OrderService {
  const MOrderService({
    required super.id,
    required super.name,
    required super.price,
    required super.image,
  });

  factory MOrderService.fromJson(Map<String, dynamic> json) =>
      _$MOrderServiceFromJson(json);

  static List<MOrderService> toEntity(List json) =>
      json.map((item) {
        return MOrderService.fromJson(item); //Now we have it as model
      }).toList();
}
