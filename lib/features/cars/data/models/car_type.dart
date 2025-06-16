import 'package:ashafaq/config/resources/image_manger.dart';

const List<CarType> carsTypes = [
  CarType('Suv/Pickup', ImageManger.car1),
  CarType('Sedan/coupe', ImageManger.car2),
];

class CarType {
  final String name;
  final String imgUrl;
  const CarType(this.name, this.imgUrl);
}
