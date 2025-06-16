import 'package:ashafaq/config/theme/color_manger.dart';
import 'package:flutter/material.dart';

class BadgeWidget extends StatelessWidget {
  const BadgeWidget({
    super.key,
    required this.content,
    this.badgeColor = ColorsManger.primaryColor,
  });

  final String content;
  final Color badgeColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: badgeColor,
        borderRadius: const BorderRadius.all(Radius.circular(57)),
      ),
      child: Text(
        content,
        style: TextStyle(
          color: Colors.white,
          fontSize: content.length > 3 ? 7 : 8,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
