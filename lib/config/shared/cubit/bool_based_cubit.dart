import 'package:flutter_bloc/flutter_bloc.dart';

class BoolBasedCubit extends Cubit<bool> {
  final bool? isSelected;
  BoolBasedCubit({this.isSelected}) : super(isSelected ?? false);

  change() => emit(!state);
}
