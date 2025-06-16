import 'package:equatable/equatable.dart';

class OrderExtra extends Equatable {
  final int id;
  final String name;
  final String image;
  final double price;
  const OrderExtra({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });

  @override
  List<Object?> get props => [id, name, price, image];
}
