import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.btnText,
    this.textUnderLine = true,
    this.fontSize = 10,
    this.textColor = const Color(0xffFFC436),

    required this.onPressed,
  });

  final String btnText;
  final bool textUnderLine;
  final Color textColor;
  final double fontSize;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: const ButtonStyle(padding: WidgetStatePropertyAll(EdgeInsets.zero)),
      onPressed: onPressed,
      child: Text(
        ' $btnText',
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
          decoration: textUnderLine ? TextDecoration.underline : null,
          decorationColor: const Color(0xffFFC436),
          decorationThickness: 2,
        ),
      ),
    );
  }
}
