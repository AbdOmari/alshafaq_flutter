import 'package:ashafaq/features/home/presentation/widgets/components/badge_widget.dart';
import 'package:ashafaq/features/request/presentation/widgets/calendar/cubits/date_helper.dart';
import 'package:flutter/material.dart';

class DiscountLeftTime extends StatelessWidget {
  const DiscountLeftTime({super.key, required this.discountEndDate});

  final String discountEndDate;

  @override
  Widget build(BuildContext context) {
    final content = DateHelper.getTimeLeftString(
      context,
      DateHelper.parsedDate(discountEndDate),
    );
    return BadgeWidget(content: content);
  }
}
