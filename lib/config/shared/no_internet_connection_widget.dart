import 'package:ashafaq/config/resources/image_manger.dart';
import 'package:ashafaq/config/shared/buttons/custom_elevated_button.dart';
import 'package:ashafaq/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class NoInternetConnectionWidget extends StatelessWidget {
  const NoInternetConnectionWidget({super.key, required this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(ImageManger.noInternetImage, height: 250, width: 250),
        const SizedBox(height: 20),
        CustomElevatedButton(
          text: appLocalizations.reLoad,
          onPressed: onPressed,
        ),
      ],
    );
  }
}
