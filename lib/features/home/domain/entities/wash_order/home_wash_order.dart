import 'package:ashafaq/features/request/data/models/location/order_location.dart';
import 'package:ashafaq/features/home/domain/entities/wash_order/wash_order.dart';

final class HomeWashOrder extends WashOrder {
  final OrderLocation orderLocation;
  HomeWashOrder({
    required this.orderLocation,
    required super.package,
    required super.car,
    required super.orderDateTime,
  });
  @override
  List<Object?> get props => [...super.props, orderLocation];
}
