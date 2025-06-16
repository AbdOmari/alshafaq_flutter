part of 'cars_bloc.dart';

sealed class CarsEvent extends Equatable {
  const CarsEvent();

  @override
  List<Object> get props => [];
}

final class GetMyCarsEvent extends CarsEvent {
  const GetMyCarsEvent();
}

final class AddCarEvent extends CarsEvent {
  final CarModel car;
  final File image;
  const AddCarEvent(this.car, this.image);
  @override
  List<Object> get props => [car, image];
}

final class DeleteCarEvent extends CarsEvent {
  final int id;
  const DeleteCarEvent(this.id);
  @override
  List<Object> get props => [id];
}

final class UpdateCarEvent extends CarsEvent {
  final CarModel car;
  const UpdateCarEvent(this.car);
  @override
  List<Object> get props => [car];
}
