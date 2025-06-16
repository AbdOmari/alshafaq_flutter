import 'package:ashafaq/features/request/data/models/addons/order_extra/order_extra_to_json/order_extra_to_json.dart';
import 'package:ashafaq/features/request/data/models/addons/order_services/m_order_service_to_json.dart';
import 'package:equatable/equatable.dart';

final class Addons extends Equatable {
  final List<OrderExtraToJson> _extras = [];
  final List<MOrderServiceToJson> _services = [];

  void addExtra(OrderExtraToJson extra) {
    if (extras.contains(extra)) {
      final index = extras.indexOf(extra);
      extras[index] = extra;
      return;
    }
    extras.add(extra);
  }

  void removeExtra(OrderExtraToJson extra) => _extras.remove(extra);

  void addService(MOrderServiceToJson service) => _services.add(service);

  void removeService(MOrderServiceToJson service) => _services.remove(service);

  double getAddonsPrice() => _calculateServicePrice() + _extrasPrice();

  double _calculateServicePrice() {
    double totalPrice = 0.0;
    for (var service in services) {
      totalPrice += service.price;
    }
    return totalPrice;
  }

  double _extrasPrice() {
    double totalPrice = 0.0;
    for (var extra in extras) {
      final extraPrice = extra.amount * extra.price;
      totalPrice += extraPrice;
    }
    return totalPrice;
  }

  String _getExtrasString() {
    String extrasString = '';
    for (var extra in extras) {
      final extraString = 'x${extra.amount} ${extra.name}\n';
      extrasString += extraString;
    }
    return extrasString;
  }

  String _getServicesString() {
    String servicesString = '';
    for (var service in services) {
      servicesString += '${service.name}\n';
    }
    return servicesString;
  }

  String getAddonsString() {
    return '${_getExtrasString()}${_getServicesString()}';
  }

  List<OrderExtraToJson> get extras => _extras;
  List<MOrderServiceToJson> get services => _services;
  @override
  List<Object?> get props => [_extras, _services];

  @override
  String toString() {
    return 'extras: $_extras service: $_services';
  }
}
