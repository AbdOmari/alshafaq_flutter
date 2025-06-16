import 'package:ashafaq/config/shared/price_widget.dart';
import 'package:ashafaq/config/shared/price_with_discount.dart';
import 'package:flutter/material.dart';

class SavingPackageCardPrice extends StatelessWidget {
  const SavingPackageCardPrice({
    super.key,
    required this.price,
    required this.discountedPrice,
  });
  final double price;
  final double? discountedPrice;

  @override
  Widget build(BuildContext context) {
    if (discountedPrice == null) {
      return PriceWidget(price: price);
    }
    return PriceWithDiscount(postPrice: discountedPrice!, prePrice: price);
  }
}
