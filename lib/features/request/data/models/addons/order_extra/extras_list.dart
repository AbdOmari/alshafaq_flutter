import 'package:ashafaq/features/request/domain/entities/order_extra.dart';

const _tissueBoxImageUrl =
    'https://cdn-icons-png.flaticon.com/512/883/883768.png';
const _airSprayer = 'https://cdn-icons-png.flaticon.com/512/3182/3182250.png';
const _box = 'https://cdn-icons-png.flaticon.com/512/679/679922.png';
final List<OrderExtra> extrasList = [
  const OrderExtra(
    id: 1,
    name: 'Add Tissue Box',
    price: 48,
    image: _tissueBoxImageUrl,
  ),
  const OrderExtra(
    id: 2,
    name: 'Add Air Sprayer',
    price: 26,
    image: _airSprayer,
  ),
  const OrderExtra(id: 3, name: 'Add Box', price: 98, image: _box),
  const OrderExtra(id: 4, name: 'Add Box2', price: 100, image: _box),
];
