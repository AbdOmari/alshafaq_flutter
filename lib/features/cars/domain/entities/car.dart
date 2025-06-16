import 'package:equatable/equatable.dart';

class Car extends Equatable {
  final int id;
  final String image;
  final String number;
  final String characters;
  final String? cityEn;
  final String cityAr;
  final String countryAr;
  final String countryEn;
  final List<int>? modelsIds;
  final String colorText;
  final String modelText;
  const Car({
    required this.id,
    required this.image,
    required this.number,
    required this.characters,
    required this.cityEn,
    required this.cityAr,
    required this.countryAr,
    required this.countryEn,
    required this.modelsIds,
    required this.colorText,
    required this.modelText,
  });
  @override
  List<Object?> get props => [
    id,
    image,
    number,
    characters,
    cityEn,
    cityAr,
    countryAr,
    countryEn,
    modelsIds,
    colorText,
    modelText,
  ];

  @override
  String toString() {
    return '''id: $id,
image: $image,
number: $number,
characters: $characters,
cityEn: $cityEn,
cityAr: $cityAr,
countryAr: $countryAr,
countryEn: $countryEn,
modelsIds: $modelsIds,
colorText: $colorText,
modelText: $modelText,''';
  }
}
