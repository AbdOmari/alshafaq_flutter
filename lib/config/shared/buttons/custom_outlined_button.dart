import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    required this.btnLabel,
    this.width,
    this.height,
    this.fillColor,
    this.txtColor = Colors.black,
    required this.onPressed,
  });

  final String btnLabel;
  final double? height;
  final double? width;
  final Color? fillColor;
  final Color txtColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,

        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: fillColor,
          borderRadius: const BorderRadius.all(Radius.circular(17)),
          border: BoxBorder.all(color: Colors.black),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              btnLabel,
              style: Theme.of(
                context,
              ).textTheme.labelMedium!.copyWith(color: txtColor, fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}
