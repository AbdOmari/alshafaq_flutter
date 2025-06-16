import 'package:ashafaq/config/resources/image_manger.dart';
import 'package:ashafaq/config/shared/bottom_sheet/base_bottom_sheet.dart';
import 'package:ashafaq/config/shared/buttons/custom_elevated_button.dart';
import 'package:ashafaq/core/sizes/dimensions.dart';
import 'package:flutter/material.dart';

class SuccessBottomSheet extends StatelessWidget {
  const SuccessBottomSheet({
    super.key,
    required this.title,
    required this.subTitle,
    required this.btnText,
    this.imagePath = ImageManger.success,
    required this.onPressed,
  });
  final String title;
  final String subTitle;
  final String btnText;
  final String imagePath;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final d = Dimensions(MediaQuery.of(context).size);
    return PopScope(
      canPop: false,
      child: BaseBottomSheet(
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: d.getComponentH(uiH: 195),
              width: d.getComponentW(uiW: 195),
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Text(title, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 5),
            Text(subTitle, style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(height: 20),
            CustomElevatedButton(text: btnText, width: 325, onPressed: onPressed),
          ],
        ),
        onPressed: onPressed,
      ),
    );
  }
}
