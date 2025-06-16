import 'package:ashafaq/config/theme/color_manger.dart';
import 'package:ashafaq/features/request/presentation/widgets/calendar/cubits/date_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DayCard extends StatelessWidget {
  const DayCard({
    super.key,
    required this.selectedDate,
    required this.dayDate,
    required this.startDate,
    required this.endDate,
    required this.dateHelper,
    required this.onSelect,
  });
  final DateTime dayDate;
  final DateTime selectedDate;
  final DateTime startDate;
  final DateTime endDate;
  final DateHelper dateHelper;
  final void Function(DateTime date)? onSelect;
  @override
  Widget build(BuildContext context) {
    final selected = dayDate.compareTo(selectedDate) == 0;
    final disable =
        dateHelper.disableBefore(dayDate) || dateHelper.disableAfter(dayDate);
    return InkWell(
      onTap:
          disable
              ? null
              : () {
                onSelect?.call(dayDate);
              },
      child: Column(
        children: [
          Text(DateFormat('E').format(dayDate)), // Mon, Tue, etc.
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: selected ? ColorsManger.primaryColor : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Text(
              dayDate.day.toString(),
              style: TextStyle(
                color:
                    disable
                        ? Colors.grey
                        : selected
                        ? Colors.white
                        : Colors.black,
              ),
            ),
          ), // 1, 2, etc.
        ],
      ),
    );
  }
}
