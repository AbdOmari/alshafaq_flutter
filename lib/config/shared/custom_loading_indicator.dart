import 'package:ashafaq/config/theme/color_manger.dart';
import 'package:flutter/material.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key, this.widgetHeight, this.color});
  final double? widgetHeight;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    if (widgetHeight == null) {
      return const Center(
        child: CircularProgressIndicator(color: ColorsManger.primaryColor),
      );
    }
    return SizedBox(
      height: widgetHeight,
      child: const Center(
        child: CircularProgressIndicator(color: ColorsManger.primaryColor),
      ),
    );
  }
}
