import 'dart:io';

import 'package:ashafaq/features/cars/data/models/m_car.dart';

abstract class ICarsRepo {
  getMyCars();
  addCar(CarModel car,{required File image});
  updateCar(CarModel car);
  deleteCar(int id);
}
