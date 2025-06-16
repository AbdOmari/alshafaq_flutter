import 'dart:developer';

import 'package:ashafaq/config/shared/buttons/custom_icon_button.dart';
import 'package:ashafaq/features/request/presentation/widgets/calendar/cubits/calendar_cubit.dart';
import 'package:ashafaq/features/request/presentation/widgets/calendar/cubits/week_month_changer_cubit.dart';
import 'package:ashafaq/features/request/presentation/widgets/calendar/cubits/date_helper.dart';
import 'package:ashafaq/features/request/presentation/widgets/calendar/day_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CustomCalendar extends StatelessWidget {
  const CustomCalendar({super.key, required this.onSelect});
  final void Function(DateTime date)? onSelect;
  static final _dateHelper = DateHelper.init(DateTime(2026, 01, 29));

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DaySelectionCubit()),
        BlocProvider(create: (context) => WeekMonthChangerCubit()),
      ],
      child: Builder(
        builder: (context) {
          final dayCubit = context.read<DaySelectionCubit>();
          final weekMonthCubit = context.read<WeekMonthChangerCubit>();
          return Container(
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: BlocBuilder<WeekMonthChangerCubit, DateTime>(
              builder: (context, weekMonthState) {
                final weekDates = _dateHelper.getWeekDates(weekMonthState);
                final months = _dateHelper.generateMonthRange();
                log('calendar months: $months');
                log('calendar weeks: $weekDates');
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DropdownButtonHideUnderline(
                          child: DropdownButton<DateTime>(
                            icon: const Icon(Icons.arrow_drop_down_sharp),
                            padding: EdgeInsets.zero,
                            underline: const SizedBox(),
                            isDense: true,

                            value: DateTime(
                              weekMonthState.year,
                              weekMonthState.month,
                            ),
                            items:
                                months.map((date) {
                                  final text = DateFormat(
                                    'MMMM yyyy',
                                  ).format(date);
                                  return DropdownMenuItem(
                                    value: DateTime(date.year, date.month),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          text,
                                          style: const TextStyle(fontSize: 13),
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ), // small manual space
                                      ],
                                    ),
                                  );
                                }).toList(),
                            onChanged: (date) {
                              if (date != null) {
                                weekMonthCubit.changeMonth(date);
                              }
                            },
                          ),
                        ),
                        Row(
                          children: [
                            CustomIconButton(
                              icon: Icons.arrow_back,
                              onPressed:
                                  () => weekMonthCubit.preWeek(
                                    _dateHelper.endDate,
                                  ),
                            ),
                            CustomIconButton(
                              icon: Icons.arrow_forward,
                              onPressed:
                                  () => weekMonthCubit.nextWeek(
                                    _dateHelper.endDate,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:
                          weekDates.map((date) {
                            return BlocConsumer<DaySelectionCubit, DateTime>(
                              listener: (context, state) {
                                log(
                                  'calendar called the onSelect: state $state',
                                );
                                onSelect?.call(state);
                              },
                              builder: (context, dayState) {
                                return DayCard(
                                  selectedDate: dayState,
                                  dayDate: DateTime(
                                    date.year,
                                    date.month,
                                    date.day,
                                  ),
                                  startDate: DateTime.now(),
                                  endDate: _dateHelper.endDate,
                                  dateHelper: _dateHelper,
                                  onSelect: (date) {
                                    dayCubit.selectDay(date);
                                    weekMonthCubit.selectDay(date);
                                  },
                                );
                              },
                            );
                          }).toList(),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
