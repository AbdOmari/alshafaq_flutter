import 'package:flutter_bloc/flutter_bloc.dart';

class AddRemoveCubit extends Cubit<int> {
  final int? initialValue;
  AddRemoveCubit({this.initialValue}) : super(initialValue??0);

  void increment() => emit(state + 1);

  void decrement() {
    if (state <= 0) return;
    emit(state - 1);
  }
}
