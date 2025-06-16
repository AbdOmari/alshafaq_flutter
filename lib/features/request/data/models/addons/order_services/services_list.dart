import 'package:ashafaq/features/request/domain/entities/order_service.dart';

const _tissueBoxImageUrl =
    'https://cdn-icons-png.flaticon.com/512/883/883768.png';
const _airSprayer = 'https://cdn-icons-png.flaticon.com/512/3182/3182250.png';
const _box = 'https://cdn-icons-png.flaticon.com/512/679/679922.png';

final List<OrderService> servicesList = [
  const OrderService(
    id: 1,
    name: 'Maintenance-1',
    price: 48,
    image: _tissueBoxImageUrl,
  ),
  const OrderService(
    id: 2,
    name: 'Maintenance-2',
    price: 26,
    image: _airSprayer,
  ),
  const OrderService(id: 3, name: 'Maintenance-3', price: 98, image: _box),
  const OrderService(id: 4, name: 'Maintenance-4', price: 100, image: _box),
];
