import 'package:flutter_bloc/flutter_bloc.dart';

class IntBaseCubit extends Cubit<int> {
  final int initialValue;
  IntBaseCubit({this.initialValue = 0}) : super(initialValue);
  void chooseItem(int index) => emit(index);
}
