import 'dart:developer';
import 'dart:io';
import 'package:ashafaq/features/cars/domain/entities/car.dart';
import 'package:ashafaq/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'm_car.g.dart';

@JsonSerializable()
class CarModel extends Car {
  const CarModel({
    required super.id,
    required super.image,
    required super.number,
    required super.characters,
    required super.cityEn,
    required super.cityAr,
    required super.countryAr,
    required super.countryEn,
    required super.modelsIds,
    required super.colorText,
    required super.modelText,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) =>
      _$CarModelFromJson(json);

  Map<String, dynamic> toJson() => _$CarModelToJson(this);

  static List<Car> fromJsonList(List json) =>
      json.map((item) {
        log('car model: json item: $item');
        final car = CarModel.fromJson(item);
        log('car model: car: $car');

        return car;
      }).toList();
}

final class CarCreator {
  String? cityAr;
  String? number;
  String? characters;
  String? colorText;
  String? modelText;
  File? image;
  String? validate(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    if (cityAr == null) {
      return appLocalizations.canNotEmpty(appLocalizations.city);
    }
    if (number == null) {
      return appLocalizations.canNotEmpty(appLocalizations.platNumber);
    }
    if (characters == null) {
      return appLocalizations.canNotEmpty(appLocalizations.name);
    }
    if (image == null) {
      return appLocalizations.selectYouCarImage;
    }
    if (modelText == null) {
      return appLocalizations.selectCarType;
    }
    return null;
  }

  CarModel? create(BuildContext context) {
    if (validate(context) != null) return null;
    return CarModel(
      id: 0,

      number: number!,
      characters: characters!,

      cityAr: cityAr!,
      colorText: colorText!,
      modelText: modelText!,
      cityEn: '',
      countryAr: '',
      countryEn: '',
      modelsIds: const [],
      image: '',
    );
  }

  @override
  String toString() {
    return 'city: $cityAr model: $modelText numbers: $number name: $characters color: $colorText img: ${image?.path}';
  }
}
