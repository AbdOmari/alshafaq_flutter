import 'dart:io';
import 'dart:developer';

import 'package:ashafaq/config/exceptions/base_exception.dart';
import 'package:ashafaq/features/cars/data/models/m_car.dart';
import 'package:ashafaq/features/cars/data/repo_impl/cars_repo_impl.dart';
import 'package:ashafaq/features/cars/domain/entities/car.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'cars_event.dart';
part 'cars_state.dart';

class CarsBloc extends Bloc<CarsEvent, CarsState> {
  final CarsRepoImpl _carsRepo;
  CarsBloc(this._carsRepo) : super(const CarsInitialState()) {
    on<GetMyCarsEvent>((event, emit) async {
      try {
        log('cars bloc :get cars');
        emit(const CarsLoadingState());
        final cars = await _carsRepo.getMyCars();
        if (cars.isEmpty) {
          emit(const NoCarsState());
        }
        emit(GotMyCarsState(cars));
      } on BaseException catch (e) {
        emit(CarsFailureState(e.message ?? ''));
      } catch (e) {
        emit(CarsFailureState(e.toString()));
      }
    });
    on<AddCarEvent>((event, emit) async {
      try {
        emit(const CarsLoadingState());
        await _carsRepo.addCar(event.car, image: event.image);
        emit(const AddedCarState());
      } on BaseException catch (e) {
        emit(CarsFailureState(e.message ?? ''));
      } catch (e) {
        emit(CarsFailureState(e.toString()));
      }
    });
    on<DeleteCarEvent>((event, emit) async {
      try {
        emit(const CarsLoadingState());
        await _carsRepo.deleteCar(event.id);
        emit(const DeletedCarState());
      } on BaseException catch (e) {
        emit(CarsFailureState(e.message ?? ''));
      } catch (e) {
        emit(CarsFailureState(e.toString()));
      }
    });
    on<UpdateCarEvent>((event, emit) async {
      try {
        emit(const CarsLoadingState());
        await _carsRepo.updateCar(event.car);
        emit(const UpdatedCarState());
      } on BaseException catch (e) {
        emit(CarsFailureState(e.message ?? ''));
      } catch (e) {
        emit(CarsFailureState(e.toString()));
      }
    });
  }
}
