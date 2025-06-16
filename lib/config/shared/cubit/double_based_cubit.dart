import 'package:flutter_bloc/flutter_bloc.dart';

class DoubleBasedCubit extends Cubit<double> {
  final double? initialValue;
  DoubleBasedCubit({this.initialValue}) : super(initialValue ?? 0.0);
  void getPrice(double price) => emit(price);
}
