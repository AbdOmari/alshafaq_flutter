import 'dart:developer';

import 'package:ashafaq/config/response/general_response.dart';
import 'package:ashafaq/core/constants/json_keys.dart';
import 'package:ashafaq/features/cars/data/models/m_car.dart';
import 'package:ashafaq/features/cars/domain/entities/car.dart';

final class CarResponse extends GeneralResponse {
  late final List<Car>? myCars;
  CarResponse.init(super.dioResponse) : super.init() {
    if (isSucceed) {
      if (super.dioResponse.requestOptions.method.toLowerCase() == 'get') {
        log('start create the response: data: $resData');
        myCars = CarModel.fromJsonList(super.resData[JsonKeys.data]);
      }
    }
  }
}
