import 'dart:developer';
import 'dart:io';

import 'package:ashafaq/config/network/tokens/impl/tokens_repo.dart';
import 'package:ashafaq/features/cars/data/models/m_car.dart';
import 'package:ashafaq/features/cars/data/services_impl/cars_service_impl.dart';
import 'package:ashafaq/features/cars/domain/entities/car.dart';
import 'package:ashafaq/features/cars/domain/i_repo/i_cars_repo.dart';

final class CarsRepoImpl implements ICarsRepo {
  final CarsServiceImpl _carsService;
  final TokensRepo _tokensRepo;
  CarsRepoImpl(this._carsService, this._tokensRepo);
  String? _token;
  Future _loadToken() async {
    log('cars repo: token: start get token $_token');
    _token = await _tokensRepo.fetchAccessToken();
    log('cars repo: token: $_token');
  }

  @override
  Future<bool> addCar(CarModel car, {required File image}) async {
    if (_token == null) await _loadToken();
    final result = await _carsService.addCar(_token!, image: image, car: car);
    if (result.isSucceed) {
      return true;
    }
    throw result.exceptions!;
  }

  @override
  Future<bool> deleteCar(int id) async {
    if (_token == null) await _loadToken();
    final result = await _carsService.deleteCar(_token!, id: id);
    if (result.isSucceed) return true;
    throw result.exceptions!;
  }

  @override
  Future<List<Car>> getMyCars() async {
    log('cars repo: start get cars');
    if (_token == null) await _loadToken();
    log('cars repo: token: $_token');
    final result = await _carsService.getMyCars(_token!);
    if (result.isSucceed) return result.myCars!;
    throw result.exceptions!;
  }

  @override
  Future updateCar(CarModel car) async {
    if (_token == null) await _loadToken();
    final result = await _carsService.updateCar(_token!, car: car);
    if (result.isSucceed) return true;
    throw result.exceptions!;
  }
}
