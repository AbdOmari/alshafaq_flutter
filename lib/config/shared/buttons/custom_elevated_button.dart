import 'package:ashafaq/core/sizes/dimensions.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.text,
    this.height = 54.0,
    this.width = 397.0,
    this.btnColor,
    this.textColor,
    this.btnTextSize,
    this.enabled = true,
    required this.onPressed,
  });
  final String text;
  final double height;
  final double width;
  final Color? textColor;
  final bool enabled;
  final Color? btnColor;
  final double? btnTextSize;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    final d = Dimensions(MediaQuery.of(context).size);
    final size = d.getComponentSize(componentUiW: width, componentUiH: height);
    return ElevatedButton(
      style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
        shape: const WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
        backgroundColor: WidgetStatePropertyAll(btnColor),
        fixedSize: WidgetStateProperty.all(size),
        padding: const WidgetStatePropertyAll(EdgeInsets.zero),
        minimumSize: const WidgetStatePropertyAll(Size.zero),
      ),
      onPressed: enabled ? onPressed : null,
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelSmall!.copyWith(
          color: textColor,
          fontSize: btnTextSize,
        ),
      ),
    );
  }
}
