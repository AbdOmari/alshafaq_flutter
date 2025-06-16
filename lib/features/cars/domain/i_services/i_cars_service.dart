import 'dart:io';

import 'package:ashafaq/features/cars/data/models/m_car.dart';

abstract class ICarsService {
  getMyCars(String token);
  addCar(String token, {required File image, required CarModel car});
  updateCar(String token, {required CarModel car});
  deleteCar(String token, {required int id});
}
