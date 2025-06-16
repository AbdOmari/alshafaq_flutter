part of 'cars_bloc.dart';

sealed class CarsState extends Equatable {
  const CarsState();

  @override
  List<Object> get props => [];
}

final class CarsInitialState extends CarsState {
  const CarsInitialState();
}

final class AddedCarState extends CarsState {
  const AddedCarState();
}

final class DeletedCarState extends CarsState {
  const DeletedCarState();
}

final class UpdatedCarState extends CarsState {
  const UpdatedCarState();
}

final class GotMyCarsState extends CarsState {
  final List<Car> cars;
  const GotMyCarsState(this.cars);
  @override
  List<Object> get props => [cars];
}

final class NoCarsState extends CarsState {
  const NoCarsState();
}
final class CarsLoadingState extends CarsState {
  const CarsLoadingState();
}

final class CarsFailureState extends CarsState {
  final String error;
  const CarsFailureState(this.error);
  @override
  List<Object> get props => [error];
}
