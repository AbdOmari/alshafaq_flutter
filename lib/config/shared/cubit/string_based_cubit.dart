import 'package:flutter_bloc/flutter_bloc.dart';

class StringBasedCubit extends Cubit<String> {
  final String? initialValue;
  StringBasedCubit({this.initialValue}) : super(initialValue ?? '');

  void getString(String string) => emit(string);
}
