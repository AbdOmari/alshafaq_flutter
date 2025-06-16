import 'package:ashafaq/features/home/domain/entities/packages/package.dart';

class SavingPackage extends Package {
  final String? discountType;
  final double? discountValue;
  final String? discountStartDate;
  final String? discountEndDate;
  final double? discountedPrice;
  final double? savedAmount;
  final double? discountPercentage;

  const SavingPackage({
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
    this.discountType,
    this.discountValue,
    this.discountStartDate,
    this.discountEndDate,
    this.discountedPrice,
    this.savedAmount,
    this.discountPercentage,
  });

  factory SavingPackage.fromJson(Map<String, dynamic> json) {
    return SavingPackage(
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
      discountType: json['discount_type'],
      discountValue: (json['discount_value'] as num?)?.toDouble(),
      discountStartDate: json['discount_start_date'],
      discountEndDate: json['discount_end_date'],
      discountedPrice: (json['discounted_price'] as num?)?.toDouble(),
      savedAmount: (json['saved_amount'] as num?)?.toDouble(),
      discountPercentage: (json['discount_percentage'] as num?)?.toDouble(),
    );
  }

  static List<SavingPackage> fromJsonList(List json) =>
      json.map((item) => SavingPackage.fromJson(item)).toList();
}
