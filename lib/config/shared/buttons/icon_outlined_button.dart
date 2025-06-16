import 'package:flutter/material.dart';

class IconOutlinedButton extends StatelessWidget {
  const IconOutlinedButton({
    super.key,

    required this.icon,
    this.width,
    this.height,
    required this.onTap,
  });

  final IconData icon;
  final double? height;
  final double? width;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(17)),
          border: BoxBorder.all(color: Colors.black),
        ),
        child: Icon(icon, size: 16, color: const Color(0xff1A1E51)),
      ),
    );
  }
}
