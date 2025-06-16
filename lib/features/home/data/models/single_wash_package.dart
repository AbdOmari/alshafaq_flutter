import 'package:ashafaq/features/home/domain/entities/packages/package.dart';

class SinglePackage extends Package {
  SinglePackage({
    required super.id,
    required super.imageUrl,
    required super.name,
    required super.features,
    required super.value,
    required super.price,
    required super.priceSuv,
    required super.priceBranch,
    required super.period,
    required super.singlePrice,
    required super.singlePriceSuv,
    required super.singlePriceBranch,
    required super.hasSingle,
    required super.hasDiscount,
  });

  factory SinglePackage.fromJson(Map<String, dynamic> json) {
    return SinglePackage(
      id: json['id'],
      imageUrl: json['image_url'],
      name: json['name'],
      features: List<String>.from(json['features']),
      value: json['value'],
      price: (json['price'] as num).toDouble(),
      priceSuv: (json['price_suv'] as num).toDouble(),
      priceBranch: (json['price_branch'] as num).toDouble(),
      period: json['period'],
      singlePrice: (json['single_price'] as num).toDouble(),
      singlePriceSuv: (json['single_price_suv'] as num).toDouble(),
      singlePriceBranch: (json['single_price_branch'] as num).toDouble(),
      hasSingle: json['has_single'],
      hasDiscount: json['has_discount'],
    );
  }

static  List<SinglePackage> fromJsonList(List json) =>
      json.map((item) => SinglePackage.fromJson(item)).toList();
}
