import 'package:ashafaq/features/cars/domain/entities/car.dart';
import 'package:ashafaq/features/request/data/models/date/order_date_time.dart';
import 'package:ashafaq/features/request/domain/entities/order_extra.dart';
import 'package:ashafaq/features/home/domain/entities/packages/package.dart';
import 'package:equatable/equatable.dart';

class WashOrder extends Equatable {
  final Package package;
  final Car car;
  final OrderDateTime orderDateTime;
  final List<OrderExtra> _orderExtras = [];
  final List<OrderExtra> _orderServices = [];
  WashOrder({
    required this.package,
    required this.car,
    required this.orderDateTime,
  });
  List<OrderExtra> get orderExtras => _orderExtras;
  List<OrderExtra> get orderServices => _orderServices;

  void addOrderExtra(OrderExtra extra) => _orderExtras.add(extra);
  bool removeOrderExtra(OrderExtra extra) => _orderExtras.remove(extra);
  void addOrderService(OrderExtra service) => _orderServices.add(service);
  bool removeOrderService(OrderExtra service) => _orderServices.remove(service);

  @override
  List<Object?> get props => [
    package,
    car,
    orderDateTime,
    _orderExtras,
    _orderServices,
  ];
}
