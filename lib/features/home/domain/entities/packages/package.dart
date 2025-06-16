import 'package:ashafaq/features/home/data/models/normal_package.dart';
import 'package:ashafaq/features/home/data/models/saving_package.dart';
import 'package:ashafaq/features/home/data/models/single_wash_package.dart';

abstract class Package {
  final int id;
  final String imageUrl;
  final String name;
  final List<String> features;
  final String value;
  final double price;
  final double priceSuv;
  final double priceBranch;
  final String period;
  final double singlePrice;
  final double singlePriceSuv;
  final double singlePriceBranch;
  final bool hasSingle;
  final bool hasDiscount;

  const Package({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.features,
    required this.value,
    required this.price,
    required this.priceSuv,
    required this.priceBranch,
    required this.period,
    required this.singlePrice,
    required this.singlePriceSuv,
    required this.singlePriceBranch,
    required this.hasSingle,
    required this.hasDiscount,
  });

  factory Package.fromJson(Map<String, dynamic> json) {
    if (json['has_single'] == true) {
      return SinglePackage.fromJson(json);
    } else if (json['value'] != "1") {
      return SavingPackage.fromJson(json);
    } else {
      return NormalPackage.fromJson(json);
    }
  }
}
