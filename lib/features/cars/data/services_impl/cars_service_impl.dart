import 'dart:developer';
import 'dart:io';

import 'package:ashafaq/config/helpers/dio_helper.dart';
import 'package:ashafaq/core/constants/json_keys.dart';
import 'package:ashafaq/core/request/endpoints.dart';
import 'package:ashafaq/features/cars/data/models/m_car.dart';
import 'package:ashafaq/features/cars/data/responses/car_response.dart';
import 'package:ashafaq/features/cars/domain/i_services/i_cars_service.dart';

final class CarsServiceImpl implements ICarsService {
  final DioHelper _dioHelper;
  const CarsServiceImpl(this._dioHelper);
  @override
  Future<CarResponse> addCar(
    String token, {
    required File image,
    required CarModel car,
  }) async {
    final body = await _dioHelper.createFormData(
      fileKey: JsonKeys.image,
      file: image,
      json: car.toJson(),
    );
    final result = await _dioHelper.post(
      CarUrls.carsUrl,
      headers: _dioHelper.requestHeaders.getHeaders(token),
      body: body,
    );

    return CarResponse.init(result);
  }

  @override
  Future<CarResponse> deleteCar(String token, {required int id}) async {
    final response = await _dioHelper.delete(
      '${CarUrls.carsUrl}/$id',
      headers: _dioHelper.requestHeaders.getHeaders(token),
    );
    return CarResponse.init(response);
  }

  @override
  Future<CarResponse> getMyCars(String token) async {
    log('cars service: start');
    final response = await _dioHelper.get(
      CarUrls.carsUrl,
      headers: _dioHelper.requestHeaders.getHeaders(token),
    );
    log('cars service: response: $response');
    return CarResponse.init(response);
  }

  @override
  Future<CarResponse> updateCar(String token, {required CarModel car}) async {
    final response = await _dioHelper.delete(
      '${CarUrls.carsUrl}/${car.id}',
      headers: _dioHelper.requestHeaders.getHeaders(token),
      body: car.toJson(),
    );
    return CarResponse.init(response);
  }
}
