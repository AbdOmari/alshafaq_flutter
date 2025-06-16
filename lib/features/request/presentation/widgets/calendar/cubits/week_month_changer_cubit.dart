import 'dart:developer';

import 'package:ashafaq/features/request/presentation/widgets/calendar/cubits/date_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeekMonthChangerCubit extends Cubit<DateTime> {
  WeekMonthChangerCubit() : super(DateHelper.getEditedDate(DateTime.now()));

  //DateTime currentS = DateTime.now();
  void selectDay(DateTime day) => emit(DateHelper.getEditedDate(day));
  void nextWeek(DateTime endDate) => _changeWeek(1, endDate);
  void preWeek(DateTime endDate) => _changeWeek(-1, endDate);

  void _changeWeek(int offset, DateTime endDate) {
    final date = state.add(Duration(days: 7 * offset));
    bool valid = false;
    if (offset == 1) {
      valid = _checkIfBefore(endDate);
      log('go next');
    } else {
      valid = _checkIfAfter();
      log('go previous');
    }
    log('is valid: $valid');
    if (valid) {
      emit(DateHelper.getEditedDate(date));
    }
  }

  bool _checkIfBefore(DateTime endDate) {
    final date = state.add(const Duration(days: 1));
    return DateHelper.getEditedDate(
      date,
    ).isBefore(DateHelper.getEditedDate(endDate));
  }

  bool _checkIfAfter() {
    final date = state.add(const Duration(days: -1));
    return DateHelper.getEditedDate(
      date,
    ).isAfter(DateHelper.getEditedDate(DateTime.now()));
  }

  //?when i select month it gives me the last accepted date
  //?if we in 29/5/2025 and i select may it returns 29/5/2025 not 1/5/2025
  void changeMonth(DateTime date) {
    final month = _preserveDayOrUseLast(DateTime.now(), date);
    emit(DateHelper.getEditedDate(month));
  }

  DateTime _preserveDayOrUseLast(DateTime currentDate, DateTime selectedMonth) {
    final preservedDay = currentDate.day;
    final year = selectedMonth.year;
    final month = selectedMonth.month;

    // Get the last valid day in the selected month
    final lastDayOfMonth = DateTime(year, month + 1, 0).day;

    // Use the preserved day if valid, otherwise fallback to last day
    final validDay =
        preservedDay <= lastDayOfMonth ? preservedDay : lastDayOfMonth;

    return DateTime(year, month, validDay);
  }
}
