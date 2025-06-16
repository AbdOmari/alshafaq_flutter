import 'package:ashafaq/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

final class DateHelper {
  final DateTime endDate;
  DateHelper.init(this.endDate);

  List<int> generateMonthList() {
    final List<int> months = [];
    final startDate = getDateNow();
    DateTime current = DateTime(startDate.year, startDate.month);

    while (current.isBefore(endDate) ||
        current.month == endDate.month && current.year == endDate.year) {
      months.add(current.month);
      current = DateTime(current.year, current.month + 1);
    }

    return months;
  }

  List<DateTime> generateMonthRange() {
    List<DateTime> months = [];
    DateTime start = DateTime.now();
    DateTime current = DateTime(start.year, start.month);
    DateTime lastMonthStart = DateTime(endDate.year, endDate.month);

    while (current.isBefore(lastMonthStart)) {
      months.add(current);
      current = DateTime(current.year, current.month + 1);
    }

    // Add the last entry with the actual day of the end date
    months.add(getEditedDate(endDate));

    return months;
  }

  List<DateTime> getWeekDates(DateTime baseDate) {
    final startOfWeek = baseDate.subtract(Duration(days: baseDate.weekday - 1));
    return List.generate(7, (i) => startOfWeek.add(Duration(days: i)));
  }

  bool disableBefore(DateTime thisDate) {
    return getEditedDate(thisDate).compareTo(getDateNow()) < 0;
  }

  bool disableAfter(DateTime thisDate) {
    final lastMonth = generateMonthRange().last;
    return getEditedDate(thisDate).compareTo(getEditedDate(lastMonth)) > 0;
  }

  static DateTime getEditedDate(DateTime date) =>
      DateTime(date.year, date.month, date.day);

  static DateTime getDateNow() =>
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  static DateTime getDateMonth(DateTime date) =>
      DateTime(date.year, date.month);

  static DateTime getMonthNow() =>
      DateTime(DateTime.now().year, DateTime.now().month);

  static String getTimeLeftString(BuildContext context, DateTime endDate) {
    final appLocalization = AppLocalizations.of(context)!;
    final now = DateTime.now();
    final difference = endDate.difference(now);

    if (difference.inSeconds <= 0) {
      return 'Expired';
    }

    if (difference.inDays > 2) {
      return '${difference.inDays} ${appLocalization.days}';
    } else {
      return '${difference.inHours} ${appLocalization.hours}';
    }
  }

  static DateTime parsedDate(String dateString) => DateTime.parse(dateString);
}
