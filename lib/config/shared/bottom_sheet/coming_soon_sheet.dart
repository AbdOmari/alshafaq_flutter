import 'package:ashafaq/config/resources/image_manger.dart';
import 'package:ashafaq/config/shared/bottom_sheet/base_bottom_sheet.dart';
import 'package:ashafaq/config/shared/buttons/custom_elevated_button.dart';
import 'package:ashafaq/core/sizes/dimensions.dart';
import 'package:ashafaq/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class ComingSoonSheet extends StatelessWidget {
  const ComingSoonSheet({super.key, required this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final d = Dimensions(MediaQuery.of(context).size);
    final appLocalizations = AppLocalizations.of(context)!;
    return BaseBottomSheet(      
      content: Column(
        children: [
          Image.asset(
            ImageManger.comingSoon,
            height: d.getComponentH(uiH: 251),
            width: d.getComponentW(uiW: 376),
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 20),

          CustomElevatedButton(
            text: appLocalizations.continueWord,
            width: 325,
            onPressed: onPressed,
          ),
        ],
      ),
      onPressed: onPressed,
    );
  }
}
