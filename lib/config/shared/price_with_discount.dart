import 'package:ashafaq/config/shared/price_widget.dart';
import 'package:flutter/material.dart';

class PriceWithDiscount extends StatelessWidget {
  const PriceWithDiscount({
    super.key,
    required this.postPrice,
    required this.prePrice,
  });
  final double prePrice;
  final double postPrice;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PriceWidget(price: prePrice, priceColor: Colors.red, isPrePrice: true),
        const SizedBox(width: 5),
        PriceWidget(price: postPrice),
      ],
    );
  }
}
