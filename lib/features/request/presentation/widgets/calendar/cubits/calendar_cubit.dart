import 'package:ashafaq/features/request/presentation/widgets/calendar/cubits/date_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DaySelectionCubit extends Cubit<DateTime> {
  DaySelectionCubit() : super(DateHelper.getEditedDate(DateTime.now()));

  //?this is the only one which color the day
  void selectDay(DateTime date) => emit(DateHelper.getEditedDate(date));
}
