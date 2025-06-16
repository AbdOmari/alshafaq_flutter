// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_order_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MOrderService _$MOrderServiceFromJson(Map<String, dynamic> json) =>
    MOrderService(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      image: json['image_url'] as String,
    );
