import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'm_order_service_to_json.g.dart';

@JsonSerializable()
final class MOrderServiceToJson extends Equatable {
  final int id;
  final String name;
  final double price;
  const MOrderServiceToJson(this.id, this.price,this.name);
  Map<String, dynamic> toJson() => _$MOrderServiceToJsonToJson(this);

  @override
  toString() {
    return 'id: $id';
  }

  @override
  List<Object?> get props => [id];
}
