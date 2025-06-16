// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_car.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarModel _$CarModelFromJson(Map<String, dynamic> json) => CarModel(
  id: (json['id'] as num).toInt(),
  image: json['image'] as String,
  number: json['number'] as String,
  characters: json['characters'] as String,
  cityEn: json['city_en'] as String?,
  cityAr: json['city_ar'] as String,
  countryAr: json['country_ar'] as String,
  countryEn: json['country_en'] as String,
  modelsIds: json['models_ids'],
  colorText: json['color_text'] as String,
  modelText: json['model_text'] as String,
);

Map<String, dynamic> _$CarModelToJson(CarModel instance) => <String, dynamic>{
  'city_ar': instance.cityAr,
  'number': instance.number,
  'characters': instance.characters,
  'color_text': instance.colorText,
  'model_text': instance.modelText,
};
