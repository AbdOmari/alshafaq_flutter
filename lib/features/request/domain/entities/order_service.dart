import 'package:equatable/equatable.dart';

class OrderService extends Equatable {
  final int id;
  final String name;
  final String image;
  final double price;
  const OrderService({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });

  @override
  List<Object?> get props => [name, price, image, id];
}
