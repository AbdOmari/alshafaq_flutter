import 'package:ashafaq/config/shared/buttons/custom_icon_button.dart';
import 'package:ashafaq/config/shared/no_content_widget.dart';
import 'package:flutter/material.dart';

class NoContentWidgetWithButton extends StatelessWidget {
  const NoContentWidgetWithButton({
    super.key,
    required this.label,
    required this.refresh,
  });
  final String label;
  final void Function()? refresh;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        NoContentWidget(label: label),
        const SizedBox(height: 10),
        CustomIconButton(icon: Icons.refresh, iconSize: 35, onPressed: refresh),
      ],
    );
  }
}
