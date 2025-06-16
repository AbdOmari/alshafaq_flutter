import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
    this.iconSize=20,
    this.iconBackgroundColor = const Color(0xffF6F6F6),
    this.iconColor = const Color(0xffABABAB),

    required this.onPressed,
  });
  final Color iconBackgroundColor;
  final Color iconColor;
  final double iconSize;
  final IconData icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: iconBackgroundColor,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: iconColor, size: iconSize),
      ),
    );
  }
}
