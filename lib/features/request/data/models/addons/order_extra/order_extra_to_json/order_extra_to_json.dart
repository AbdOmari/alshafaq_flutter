import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'order_extra_to_json.g.dart';

@JsonSerializable()
final class OrderExtraToJson extends Equatable {
  final String name;
  final int id;
  final int amount;
  final double price;
  const OrderExtraToJson(this.id, this.amount, this.price, this.name);
  Map<String, dynamic> toJson() => _$OrderExtraToJsonToJson(this);

  @override
  String toString() {
    return 'id: $id amount: $amount price: $price';
  }

  @override
  List<Object?> get props => [id];
}
