import 'package:ashafaq/config/shared/buttons/icon_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBarLeadingArrow extends StatelessWidget {
  const AppBarLeadingArrow({super.key, this.onTap});
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return IconOutlinedButton(
      icon: Icons.arrow_back_ios_outlined,
      width: 45,
      height: 45,
      onTap: onTap ?? () => context.pop(),
    );
  }
}
